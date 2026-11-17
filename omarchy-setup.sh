#!/bin/bash
set -euo pipefail

DOTFILES="$HOME/dev/dotfiles"

# ── packages ─────────────────────────────────────────────────
# omarchy-pkg-add skips anything already installed
omarchy-pkg-add tig tree

# ── herdr ────────────────────────────────────────────────────
# installed and started by Omarchy; replace its config with ours
mkdir -p "$HOME/.config/herdr"
ln -sfn "$DOTFILES/herdr/config.toml" "$HOME/.config/herdr/config.toml"
# gitview plugin: changed files + diff, bound in herdr/config.toml
grep -qs '"chmarax.gitview"' "$HOME/.config/herdr/plugins.json" ||
  herdr plugin install ChmaraX/herdr-gitview --yes
# auto-title: names tabs/panes from agent session (omp, claude), process, git branch.
# Starts with the herdr server; after installing into a running one: herdr plugin action invoke herdr.auto-title.restart
grep -qs '"herdr.auto-title"' "$HOME/.config/herdr/plugins.json" ||
  herdr plugin install kryptamine/herdr-auto-title --ref stable --yes
