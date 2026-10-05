#!/bin/bash
set -euo pipefail

DOTFILES="$HOME/dev/dotfiles"

# ── apt packages ─────────────────────────────────────────────
# apt skips anything already installed
# gnome-sushi: space-bar file preview in nautilus
sudo apt update
sudo apt install -y \
  zsh tmux kitty git curl \
  fzf ripgrep silversearcher-ag tig tree \
  wl-clipboard gnome-tweaks gnome-sushi

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
[ -d "$HOME/.tmux/plugins/tpm" ] ||
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

# ── symlinks ─────────────────────────────────────────────────
# -sfn: replace an existing link instead of nesting inside it
link() { ln -sfn "$DOTFILES/$1" "$2"; }
mkdir -p "$HOME/.config"
link ignore/.ignore    "$HOME/.ignore"
link zsh/.zshrc        "$HOME/.zshrc"
link zsh/.aliases      "$HOME/.aliases"
link tmux/.tmux.conf   "$HOME/.tmux.conf"
link kitty             "$HOME/.config/kitty"
link nvim              "$HOME/.config/nvim"
link wireplumber       "$HOME/.config/wireplumber"

# ── settings ─────────────────────────────────────────────────
# key repeat (gnome)
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
gsettings set org.gnome.desktop.peripherals.keyboard delay 280

git config --global push.default current
git config --global push.autoSetupRemote true

echo "Done. Open tmux and press prefix + I to install tmux plugins."
