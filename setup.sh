#!/bin/bash
set -euo pipefail

DOTFILES="$HOME/dev/dotfiles"

# ── apt packages ─────────────────────────────────────────────
# apt skips anything already installed
# gnome-sushi: space-bar file preview in nautilus
# build-essential: C compiler for nvim treesitter parsers
sudo apt update
sudo apt install -y \
  zsh tmux kitty git curl xz-utils fontconfig build-essential \
  fzf ripgrep silversearcher-ag tig tree \
  wl-clipboard gnome-tweaks gnome-sushi flameshot

# ── shell ────────────────────────────────────────────────────
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "oh-my-zsh - installing..."
  RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_PLUGINS="$HOME/.oh-my-zsh/custom/plugins"
[ -d "$ZSH_PLUGINS/zsh-syntax-highlighting" ] ||
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_PLUGINS/zsh-syntax-highlighting"

# z — https://github.com/rupa/z
[ -e /opt/z.sh ] ||
  sudo curl -fsSL -o /opt/z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh

[ "$SHELL" = "$(command -v zsh)" ] || chsh -s "$(command -v zsh)"

# ── tmux ─────────────────────────────────────────────────────
# not in daily use: replaced by herdr (see herdr/). Kept so the config still works if needed.
[ -d "$HOME/.tmux/plugins/tpm" ] ||
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

# ── hunk ─────────────────────────────────────────────────────
# terminal diff viewer — https://hunk.dev
# --no-modify-path: zsh/.zshrc already adds ~/.hunk/bin to PATH
[ -x "$HOME/.hunk/bin/hunk" ] ||
  curl -fsSL https://hunk.dev/install.sh | sh -s -- --no-modify-path

# ── herdr ────────────────────────────────────────────────────
# terminal workspace manager, started by zsh/.zshrc — https://herdr.dev
[ -x "$HOME/.local/bin/herdr" ] ||
  curl -fsSL https://herdr.dev/install.sh | sh

# ── claude code ──────────────────────────────────────────────
# native install: ~/.local/bin/claude, auto-updates itself
[ -x "$HOME/.local/bin/claude" ] ||
  curl -fsSL https://claude.ai/install.sh | bash

# ── fonts ────────────────────────────────────────────────────
# Fira Mono patched with Nerd Font symbols (icons in nvim, tmux, prompt)
FONT_DIR="$HOME/.local/share/fonts/FiraMonoNerdFont"
if [ ! -d "$FONT_DIR" ]; then
  echo "FiraMono Nerd Font - installing..."
  mkdir -p "$FONT_DIR"
  curl -fsSL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.tar.xz |
    tar -xJ -C "$FONT_DIR" --wildcards '*.otf'
  fc-cache -f "$FONT_DIR"
fi

# ── symlinks ─────────────────────────────────────────────────
# -sfn: replace an existing link instead of nesting inside it.
# A real dir (e.g. ~/.claude/skills created by an agent) would still nest it, so move it aside.
link() {
  if [ -d "$2" ] && [ ! -L "$2" ]; then
    mv "$2" "$2.bak.$(date +%Y%m%d%H%M%S)"
    echo "$2 was a directory - moved to $2.bak.*, copy anything you need into $DOTFILES/$1"
  fi
  ln -sfn "$DOTFILES/$1" "$2"
}
mkdir -p "$HOME/.config"
link ignore/.ignore    "$HOME/.ignore"
link zsh/.zshrc        "$HOME/.zshrc"
link zsh/.aliases      "$HOME/.aliases"
link tmux/.tmux.conf   "$HOME/.tmux.conf"
link tig/tigrc         "$HOME/.tigrc"
link kitty             "$HOME/.config/kitty"
link nvim              "$HOME/.config/nvim"
link wireplumber       "$HOME/.config/wireplumber"
mkdir -p "$HOME/.config/herdr"
link herdr/config.toml "$HOME/.config/herdr/config.toml"

# claude code: plugins/marketplaces auto-install from settings.json
mkdir -p "$HOME/.claude"
link claude/settings.json "$HOME/.claude/settings.json"
link claude/CLAUDE.md     "$HOME/.claude/CLAUDE.md"
# agent skills (agent-neutral), one source for every agent:
# - Claude Code reads ~/.claude/skills; opencode also scans it by default
# - omp only scans foreign (~/.claude) user dirs when opted in, so it gets its native dir
link skills              "$HOME/.claude/skills"
mkdir -p "$HOME/.omp/agent"
link skills              "$HOME/.omp/agent/skills"
mkdir -p "$HOME/.claude/hooks"
link claude/hooks/tmux-status.sh "$HOME/.claude/hooks/tmux-status.sh"
link claude/hooks/herdr-agent-state.sh "$HOME/.claude/hooks/herdr-agent-state.sh"
# i-have-adhd plugin: flag file makes it load in every session.
# Off for one session: say "stop adhd mode". Off until next setup run: rm the flag.
# Off for good: delete this line, or disable the plugin in claude/settings.json.
touch "$HOME/.claude/.i-have-adhd-always"

# ── settings ─────────────────────────────────────────────────
# key repeat (gnome)
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
gsettings set org.gnome.desktop.peripherals.keyboard delay 280

git config --global push.default current
git config --global push.autoSetupRemote true

echo "Done. Open tmux and press prefix + I to install tmux plugins."
