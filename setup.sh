#!/bin/bash

# Setup script

echo ""
echo "~~ Are you ready? ~~"
echo ""

APP="z.sh"
if [ ! -e /opt/z.sh ]
then
    echo "$APP - Downloading..."
    curl -LJO https://raw.githubusercontent.com/rupa/z/master/z.sh
    sudo mv z.sh /opt/
else
    echo "$APP - Skipping"
fi

APP="tmux"
if ! command -v $APP &> /dev/null
then
    echo "$APP - Downloading..."
    sudo apt install $APP
    exit 1
else
    echo "$APP - Skipping"
fi

APP="gnome-tweaks"
if ! command -v $APP &> /dev/null
then
    echo "$APP - Downloading..."
    sudo apt install $APP
    exit 1
else
    echo "$APP - Skipping"
fi

APP="tree"
if ! command -v $APP &> /dev/null
then
    echo "$APP - Downloading..."
    sudo apt install $APP
else
    echo "$APP - Skipping"
fi

APP="tig"
if ! command -v $APP &> /dev/null
then
    echo "$APP - Downloading..."
    sudo apt install $APP
else
    echo "$APP - Skipping"
fi

APP="rg"
if ! command -v $APP &> /dev/null
then
    echo "$APP - Downloading..."
    sudo apt install ripgrep # <-- SPECIFIC TO RIPGREP
else
    echo "$APP - Skipping"
fi

APP="fzf"
if ! command -v $APP &> /dev/null
then
    echo "$APP - Downloading..."
    sudo apt install $APP -y
else
    echo "$APP - Skipping"
fi

APP="kitty"
if ! command -v $APP &> /dev/null
then
    echo "$APP - Downloading..."
    sudo apt install $APP -y
else
    echo "$APP - Skipping"
fi

# key repeat gnome specific
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
gsettings set org.gnome.desktop.peripherals.keyboard delay 280

# go
# check https://go.dev/dl/ for latest version
# rm -rf /usr/local/go && tar -C /usr/local -xzf go1.21.4.linux-amd64.tar.gz
# make sure go path is properly set in zshrc

APP="efm-langserver"
if ! command -v $APP &> /dev/null
then
    echo "$APP - Downloading..."
    # make sure you own $GOPATH
    go install github.com/mattn/efm-langserver@latest
else
    echo "$APP - Skipping"
fi

if ! command -v zsh &> /dev/null
then
  echo "oh-my-zsh - Downloading..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "oh-my-zsh - Skipping"
fi

# git specific
git config --global --add push.default current
git config --global --add push.autoSetupRemote true

# symlinks
ln -s ~/dev/dotfiles/ignore/.ignore ~/.ignore
ln -s ~/dev/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dev/dotfiles/zsh/.aliases ~/.aliases
ln -s ~/dev/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s ~/dev/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/dev/dotfiles/nvim ~/.config/

# npm packages
npm install -g eslint_d typescript yarn typescript-language-server stylelint stylelint-lsp
