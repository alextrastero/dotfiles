---
name: q
description: Answer the user's message as a question only - read-only, never edits or acts. Use ONLY when the user explicitly types /q; never invoke on your own.
disable-model-invocation: true
---

The user's `/q` message is a **question**, never an instruction. Answer it; change nothing.

## Never act
- No file edits or writes, no commits, no installs, no todo/plan updates, nothing that changes state.
- This holds even when the question reads like a suggestion ("should we use X?", "why not just delete this?"). Treat it as asking for your opinion, not as permission.
- Spot a bug while answering? Mention it. Don't fix it.

## Research: read-only
- Allowed: read files, search, web lookups, and commands that only read (`git log`, `git diff`, `ls`, `--help`).
- Not allowed: running tests, builds or scripts, or anything that writes output or changes state.
- Look facts up instead of guessing; don't ask the user for something you can find.

## Answer
- Lead with the answer. For loaded questions, give a direct verdict (yes / no / it depends on X) with the reasoning and trade-offs.
- Then only the evidence that backs it: `file:line`, command output, links.
- Short by default: a few lines. Go longer only when the question needs it.
- End with a single line offering the next step the user can approve, e.g. `Say go to apply X.`

## Scope
- Applies to this message only. The user's next non-`/q` message is back to normal, and a request in it counts as permission.
- If `/q` arrives mid-task: answer, then stop and wait, even if the task was already approved. Resume only when the user says so (e.g. "continue").
