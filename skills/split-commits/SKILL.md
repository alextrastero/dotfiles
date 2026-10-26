---
name: split-commits
description: Split the working tree's unstaged (and untracked) changes into a logically ordered, reviewable story of small commits using git add -p, matching the repo's own commit style.
triggers:
  - split commits
  - split changes
  - storyline
  - logical commits
  - reviewable commits
  - break up diff
  - split into commits
argument-hint: "[focus or extra instructions]"
---

# Split Commits Skill

## Purpose

Take everything currently unstaged (plus untracked new files) in a repo and turn it into an
ordered sequence of small, single-purpose commits that read as a story — even when one file's
diff actually contains hunks belonging to two or three unrelated logical changes, or when the
"same" logical change is spread thin across many files.

## When to Activate

- The user says things like "split these changes into commits", "make this a reviewable
  storyline", "break this diff up logically", or references files where unrelated changes are
  tangled together in a single diff.
- There are unstaged changes (`git status --short` shows `M`/`??` entries) and the user wants
  commit-sized, reviewable chunks instead of one big commit.

## Preconditions / Checks

1. Confirm this is a git repo and there is something to split: `git status --short --branch`.
2. If there are ALSO already-staged changes at the start, ask the user whether those should be
   folded into the storyline or left alone — don't silently absorb pre-existing staged work.
3. Never run on a dirty rebase/merge in progress (`git status` will show it) — stop and tell the
   user instead of guessing.

## Workflow

1. **Gather context**
   - `git diff` — unstaged changes, hunk-by-hunk.
   - `git status --short` — to see untracked (`??`) files too; untracked files are IN SCOPE and
     get grouped into the storyline like any other change (read their content to know where they
     belong).
   - `git log --oneline -20` — learn this repo's real commit style (prefix convention like
     `feat:`/`fix:`/`chore:`, tense, capitalization, length). Match it. Do not default to
     Conventional Commits if the repo doesn't already use them.

2. **Understand the diff at hunk granularity, not file granularity**
   - Read every hunk in every changed file. A single file can legitimately contribute hunks to
     more than one commit in the storyline (e.g. one hunk is a helper used by "commit 3", another
     hunk in the same file is unrelated cleanup that belongs in "commit 5").
   - Group hunks/files by logical concern: what change do they implement together, regardless of
     which physical file they live in.
   - Order the groups so dependencies come first (new util before its first caller, type/schema
     changes before the code that uses them, renames/moves before behavioral changes on the moved
     code where separable).
   - Sketch the ordered list of planned commits (one line each: files touched + one-line intent)
     and share it with the user before staging anything, so they know the destination — this is
     an FYI outline, not a gate. Do not wait for approval here; move straight into execution.

3. **Execute one commit at a time, pausing after each for review** (per user preference — no
   single big upfront approval, no fully autonomous run):
   - For a file where the WHOLE file's changes belong to this commit: `git add <path>`.
   - For a file where only SOME hunks belong to this commit: use `git add -p <path>` driven
     non-interactively by piping the response sequence, e.g.
     `printf 'y\nn\ny\n' | git add -p <path>`. Use `y`/`n` per hunk in the order git presents them.
   - When a hunk itself mixes two logical changes: send `s` to attempt to split it into smaller
     hunks, then `y`/`n` each resulting piece. If `s` can't split finely enough (the two changes
     are on immediately adjacent/overlapping lines), do NOT try to drive interactive `e` mode
     through a piped TTY session — it opens `$EDITOR` and isn't reliably scriptable. Instead:
     extract that hunk from `git diff`, hand-edit a copy of the patch text to contain only the
     lines for this commit's concern, and apply it with `git apply --cached -` (feeding the edited
     patch on stdin). Always re-check with `git diff --cached` afterward that only the intended
     lines got staged.
   - For untracked files: `git add <path>` when the whole new file belongs to this commit's
     concern. If a new file needs no splitting (the common case), just add it whole.
   - Before committing, run `git diff --cached` and eyeball it against the intended concern for
     this commit — confirm no stray hunk leaked in.
   - Commit with a message matching the repo's own style (from step 1).
   - Show the user the resulting commit (`git show --stat HEAD` or similar) and pause: let them
     say "continue", "redo this one", or "stop" before moving to the next group.
   - Repeat until every hunk and every untracked file has been committed.

4. **Never**
   - Use `git add -A` / `git add .` (would defeat the whole point of a hunk-level split).
   - Amend, force-push, or skip hooks (`--no-verify`) as part of this workflow.
   - Silently reorder or drop a hunk the user didn't ask you to drop.

## Gotchas

- `git add -p`'s prompt order matches the hunk order in `git diff`, not file order across
  multiple files passed at once — drive it one file at a time so the piped `y`/`n`/`s` sequence
  lines up with what you actually intend for that file.
- After a `s` split, the number of sub-hunks isn't known until git shows them — send responses
  hunk-by-hunk interactively (re-invoke rather than pre-computing a long fixed answer string) if
  the count is uncertain.
- Always verify with `git diff --cached` before every commit — this is the real safety net against
  a bad `add -p` split, not the plan sketched in step 2.
- If a group turns out empty after staging (e.g. hunks all got misassigned to an earlier commit),
  say so and re-plan rather than forcing an empty commit.

## Example

```
User: split these changes into commits
Assistant:
  - gathers git diff + git log style
  - proposes storyline outline:
      1. libs/utils/src/foo.ts (new helper) — chore: add foo helper
      2. apps/studio/.../bar.tsx (hunk 1) + libs/utils/src/foo.ts caller — feat: use foo in bar
      3. apps/studio/.../bar.tsx (hunk 2, unrelated) — fix: correct off-by-one in bar loop
  - stages + commits group 1, shows it, asks to continue
  - stages group 2 via `git add -p` (y/n per hunk), shows it, asks to continue
  - stages group 3 via a hand-edited patch applied with `git apply --cached -`, shows it, done
```
