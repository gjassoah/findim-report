#!/usr/bin/env python3
"""Run Codex jobs headless and keep a durable record of each job.

    tools/codex_run.sh run codex/tasks/NN-name.md [--effort E] [--model M]
    tools/codex_run.sh resume NN-name [--message TEXT] [--effort E] [--model M] [--add-dir DIR]
    tools/codex_run.sh status

A job is named after its task file. Each attempt keeps its own files under .cache/codex/<job>/ (git-ignored):
the JSON event stream, stderr, and the final answer. job.json records model, effort, session id (saved as
soon as Codex announces it) and the attempts. The latest accepted answer is copied to codex/outputs/<job>.md.

An attempt counts as "done" only if Codex emitted `turn.completed` and the answer file is non-empty. An
`error` or `turn.failed` event mentioning a usage or rate limit marks the job "blocked"; resume it after the
reset. Everything else is "failed". The public queue codex/QUEUE.md gets one sanitised row per job (no raw
arguments, no absolute paths).

Codex needs write access to its own state directory, so this runs outside Claude Code's sandbox (a
project-local exception for tools/codex_run.sh); issue the command on its own, not chained.
"""
import argparse, fcntl, json, os, re, subprocess, sys, time
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
QUEUE = ROOT / "codex" / "QUEUE.md"
OUT = ROOT / "codex" / "outputs"
CACHE = ROOT / ".cache" / "codex"
DEFAULT_MODEL = "gpt-6-astra"
LIMIT_RE = re.compile(r"usage limit|rate limit|too many requests|quota|try again (at|in)", re.I)


def now():
    return time.strftime("%Y-%m-%d %H:%M")


def sanitise(text, n=160):
    text = text.replace(str(Path.home()), "~").replace("|", "/").replace("\n", " ")
    return text[:n]


def load(job):
    p = CACHE / job / "job.json"
    return json.loads(p.read_text()) if p.exists() else {"job": job, "attempts": []}


def save(rec):
    d = CACHE / rec["job"]
    d.mkdir(parents=True, exist_ok=True)
    tmp = d / "job.json.tmp"
    tmp.write_text(json.dumps(rec, indent=2))
    tmp.replace(d / "job.json")


def queue_row(rec, status, note):
    # The session id stays in the git-ignored job.json; the public queue does not record it.
    row = (f"| {rec['job']} | {status} | {now()} | {rec.get('model')}, effort {rec.get('effort')}; "
           f"{sanitise(note)} |\n")
    with open(QUEUE, "r+") as f:
        fcntl.flock(f, fcntl.LOCK_EX)
        lines = f.readlines()
        for i, l in enumerate(lines):
            if l.startswith(f"| {rec['job']} |"):
                lines[i] = row
                break
        else:
            lines.append(row)
        f.seek(0); f.truncate(); f.writelines(lines)


def attempt(rec, argv):
    n = len(rec["attempts"]) + 1
    d = CACHE / rec["job"]
    d.mkdir(parents=True, exist_ok=True)
    events, errs, answer = d / f"attempt-{n}.jsonl", d / f"attempt-{n}.stderr", d / f"attempt-{n}.md"
    a = {"n": n, "started": now(), "kind": argv[2] if argv[2] == "resume" else "run"}
    rec["attempts"].append(a); save(rec)
    queue_row(rec, "running", f"attempt {n}")
    completed, problems = False, []
    # For a new run the task text comes on stdin (argv ends with "-"); a resume gets its prompt as an argument.
    stdin = open(rec["task_path"]) if argv[-1] == "-" else subprocess.DEVNULL
    with open(events, "w") as ev, open(errs, "w") as er:
        p = subprocess.Popen(argv[:-1] + ["-o", str(answer), argv[-1]], cwd=ROOT, stdout=subprocess.PIPE,
                             stderr=er, stdin=stdin, text=True)
        for line in p.stdout:
            ev.write(line); ev.flush()
            try:
                e = json.loads(line)
            except ValueError:
                continue
            t = e.get("type")
            if t == "thread.started" and e.get("thread_id"):
                rec["session"] = e["thread_id"]; save(rec)
            elif t == "turn.completed":
                completed = True
            elif t in ("error", "turn.failed"):
                problems.append(json.dumps(e))
        rc = p.wait()
    a.update(ended=now(), exit=rc)
    text = " ".join(problems) + " " + errs.read_text()
    ok = completed and answer.exists() and answer.read_text().strip()
    if ok:
        status, note = "done", f"answer codex/outputs/{rec['job']}.md (attempt {n})"
        # Public copy: paths relative to the repository, home directory as ~.
        text_out = answer.read_text().replace(str(ROOT) + "/", "").replace(str(Path.home()), "~")
        (OUT / f"{rec['job']}.md").write_text(text_out)
    elif LIMIT_RE.search(text):
        m = LIMIT_RE.search(text)
        status = "blocked"
        note = "interrupted by a usage or rate limit"
    else:
        status = "failed"
        note = f"exit {rc}; " + (problems[0] if problems else "no turn.completed; see stderr")
    a["status"] = status; rec["status"] = status; save(rec)
    queue_row(rec, status, note)
    print(f"{rec['job']}: {status}")
    return 0 if status == "done" else (2 if status == "blocked" else 1)


def main():
    ap = argparse.ArgumentParser()
    sub = ap.add_subparsers(dest="cmd", required=True)
    r = sub.add_parser("run"); r.add_argument("task")
    r.add_argument("--add-dir", action="append", default=[], help="extra writable directory for Codex")
    s = sub.add_parser("resume"); s.add_argument("job"); s.add_argument("--message")
    s.add_argument("--add-dir", action="append", default=[],
                   help="extra writable directory (default: those recorded by `run`)")
    for q in (r, s):
        q.add_argument("--effort"); q.add_argument("--model")
    sub.add_parser("status")
    a = ap.parse_args()
    if a.cmd == "status":
        print(QUEUE.read_text()); return 0
    if a.cmd == "run":
        task = (ROOT / a.task) if not Path(a.task).is_absolute() else Path(a.task)
        rec = load(task.stem)
        rec.update(task_path=str(task), model=a.model or DEFAULT_MODEL, effort=a.effort or "max")
        rec["add_dirs"] = [str(Path(d).expanduser().resolve()) for d in a.add_dir]
        extra = [x for d in rec["add_dirs"] for x in ("--add-dir", d)]
        argv = ["codex", "exec", "--json", "-C", str(ROOT), "-s", "workspace-write", "--skip-git-repo-check",
                *extra, "-m", rec["model"], "-c", f'model_reasoning_effort="{rec["effort"]}"', "-"]
        return attempt(rec, argv)
    rec = load(a.job)
    if not rec.get("session"):
        sys.exit(f"no recorded session for {a.job}")
    if a.model: rec["model"] = a.model
    if a.effort: rec["effort"] = a.effort
    msg = a.message or ("Continue the task from where you stopped. Re-read the task file and any partial "
                        "output files first, then finish the deliverable.")
    # `codex exec resume` has no --add-dir option; the extra writable roots go in as a config override.
    if a.add_dir:
        rec["add_dirs"] = [str(Path(d).expanduser().resolve()) for d in a.add_dir]
    roots = rec.get("add_dirs", [])
    extra = ["-c", 'sandbox_mode="workspace-write"',
             "-c", "sandbox_workspace_write.writable_roots=" + json.dumps(roots)] if roots else []
    argv = ["codex", "exec", "resume", "--json", "-m", rec["model"], *extra,
            "-c", f'model_reasoning_effort="{rec["effort"]}"', rec["session"], msg]
    return attempt(rec, argv)


if __name__ == "__main__":
    sys.exit(main())
