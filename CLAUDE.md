# About Me

Senior engineer. Default to terse, technical responses — skip preamble and trailing
summaries.

# Code Preferences

## Architecture
- Value architectural consistency — prefer fixing the abstraction over adding flags/branches that preserve inconsistency.
- Don't introduce abstractions for hypothetical future needs. Three similar lines beats a premature abstraction.

## Style
- Default to no comments. Only write one when the *why* is non-obvious.
- No "what" comments — well-named identifiers do that job.
- No references to current task/PR/caller in comments — that belongs in commit messages.

## Error Handling
- Trust internal callers; only validate at system boundaries (user input, external APIs).

# Working Style

- Show me the diff, don't narrate it.
- Ask before creating new files; prefer editing existing ones.
- For exploratory questions, give 2–3 sentences with a recommendation + tradeoff, not a plan.
- Don't claim a UI change works without actually loading it in a browser.

# Tools

- Prefer parallel tool calls when work is independent.
