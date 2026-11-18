#!/bin/bash
set -euo pipefail

DOTFILES="$HOME/dev/dotfiles"

# ── packages ─────────────────────────────────────────────────
# omarchy-pkg-add skips anything already installed
omarchy-pkg-add tig tree

# ── theme ────────────────────────────────────────────────────
# everforest matches nvim/lua/plugins/colorscheme.lua; theme set restyles every app, so skip it when already applied
[ "$(cat "$HOME/.local/state/omarchy/current/theme.name" 2>/dev/null)" = everforest ] ||
  omarchy theme set everforest

# ── shell ────────────────────────────────────────────────────
# bash/.bashrc keeps Omarchy's stub and loads the aliases shared with zsh
ln -sfn "$DOTFILES/bash/.bashrc"   "$HOME/.bashrc"
ln -sfn "$DOTFILES/zsh/.aliases"   "$HOME/.aliases"
ln -sfn "$DOTFILES/ignore/.ignore" "$HOME/.ignore"
ln -sfn "$DOTFILES/tig/tigrc"      "$HOME/.tigrc"

# ── ssh ──────────────────────────────────────────────────────
# Omarchy runs no ssh agent; use OpenSSH's socket-activated one so the key passphrase is asked once per login
systemctl --user enable --now ssh-agent.socket
mkdir -p "$HOME/.config/environment.d"
ln -sfn "$DOTFILES/environment.d/ssh-agent.conf" "$HOME/.config/environment.d/ssh-agent.conf"
mkdir -p -m 700 "$HOME/.ssh"
ln -sfn "$DOTFILES/ssh/config" "$HOME/.ssh/config"

# ── hyprland ─────────────────────────────────────────────────
# hyprland.lua stays Omarchy's per-machine file; it already requires input and only gains a require for our rules
ln -sfn "$DOTFILES/hypr/input.lua"   "$HOME/.config/hypr/input.lua"
ln -sfn "$DOTFILES/hypr/windows.lua" "$HOME/.config/hypr/windows.lua"
grep -qs 'require("hypr.windows")' "$HOME/.config/hypr/hyprland.lua" ||
  echo 'require("hypr.windows")' >> "$HOME/.config/hypr/hyprland.lua"

# ── tmux ─────────────────────────────────────────────────────
# tmux loads ~/.config/tmux/tmux.conf after ~/.tmux.conf, so Omarchy's copy would override ours.
# Its default stays in /usr/share/omarchy/config/tmux, and Omarchy migrations skip a missing file.
rm -f "$HOME/.config/tmux/tmux.conf"
ln -sfn "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"
[ -d "$HOME/.tmux/plugins/tpm" ] ||
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
# tpm reads the plugin list from a running server, so give it a throwaway session
tmux new-session -d -s tpm-install
"$HOME/.tmux/plugins/tpm/bin/install_plugins" >/dev/null
tmux kill-session -t tpm-install

# ── neovim ───────────────────────────────────────────────────
# Omarchy copies its LazyVim starter into ~/.config/nvim; replace it with ours
link() {
  if [ -d "$2" ] && [ ! -L "$2" ]; then
    mv "$2" "$2.bak.$(date +%Y%m%d%H%M%S)"
    echo "$2 was a directory - moved to $2.bak.*, copy anything you need into $DOTFILES/$1"
  fi
  ln -sfn "$DOTFILES/$1" "$2"
}
link nvim "$HOME/.config/nvim"

# ── omp ──────────────────────────────────────────────────────
mkdir -p "$HOME/.omp/agent/extensions"
link skills          "$HOME/.omp/agent/skills"
link omp/config.yml  "$HOME/.omp/agent/config.yml"
link omp/extensions/herdr-omp-agent-state.ts "$HOME/.omp/agent/extensions/herdr-omp-agent-state.ts"

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
