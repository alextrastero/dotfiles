---
name: html
description: Take the last findings/research from the conversation and render a single self-contained HTML doc — restructured to teach (summary → sections → key takeaways), not just a chat dump. Use when the user types /html after any research, audit, or analysis.
---

# HTML Doc Renderer

Take whatever findings, research, or analysis was just produced in this conversation and
render it as a clean, self-contained HTML document structured for reading and presentation
— not a raw chat transcript.

## Output location

All audits live in **one file**: `~/.claude/html-output/dudley-estates-seo-audit.html`

- Never create per-property files — always add to the single tracker.
- After writing, open with: `xdg-open ~/.claude/html-output/dudley-estates-seo-audit.html`
- Print the reopen command so the user can return to it.

```bash
mkdir -p ~/.claude/html-output
```

## Document structure

Full-screen app layout (sidebar + scrollable content area):

```
┌─ topbar ──────────────────────────────────────────────┐
│ Dudley Estates — SEO Audit Report        Last updated  │
├─ sidebar (280px) ─┬─ content (flex) ─────────────────┤
│ Properties list   │ One .prop-section per property     │
│ with score pills  │ Header → stat cards → findings     │
│                   │ → change log → full check table    │
└───────────────────┴──────────────────────────────────-─┘
```

- **Sidebar** — sticky property list with `id="prop-nav"`, one `<li>` per property with score pill.
- **Content** — one `<div class="prop-section" id="prop-DExxxx">` per property.
- **Findings** grouped by severity block: 🔴 Critical → 🟡 High → 🔵 Medium → ✅ Working.
- **Change log** — `<ul class="change-log">` per property; append entries as fixes are applied.
- **Full check table** — one row per SEO check at the bottom of each property section.

Never just paste the conversation. Synthesise: group findings by severity, include ready-to-paste fix text, demote minor notes to the check table.

## Design rules (all CSS must be inline in <style> — no external assets)

- **Self-contained** — no CDN links, no external fonts, no images with external src.
  Everything in one file. Must open offline and be safe to email.
- **System fonts** — `font-family: system-ui, -apple-system, sans-serif`
- **Prints well** — include `@media print` block:
  - white background, black text
  - ink-friendly code blocks (light border, no dark bg)
  - `page-break-inside: avoid` on callouts and tables
  - TOC hidden on print (`#toc { display: none }`)
  - explicit page margins (`@page { margin: 2cm }`)
- **Quick reference** — TOC at the top with anchor links to each `<h2>` section
- **Callout boxes** — three types:
  - `.callout.key`  — key finding (blue-left-border)
  - `.callout.warn` — warning / risk (amber-left-border)
  - `.callout.note` — extra context (grey-left-border)
- **Readable tables** — striped rows, sticky header
- **Code blocks** — monospace, syntax-neutral, light background

## Procedure

1. Read `assets/template.html` (next to this SKILL.md) for the base shell.
2. Identify the topic from the conversation and derive the filename.
3. Synthesise the content: summary → sections → takeaways.
4. Populate the template (replace all `<!-- PLACEHOLDER -->` comments).
5. Write the file to `~/.claude/html-output/<topic>.html`.
6. Validate it parses:
   ```bash
   python3 -c "from html.parser import HTMLParser; p=HTMLParser(); p.feed(open('$HOME/.claude/html-output/<topic>.html').read()); print('HTML OK')"
   ```
7. Open with `xdg-open` and print the reopen command.

## Template location

`~/.claude/skills/html/assets/template.html`
