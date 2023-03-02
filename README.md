# dotfiles

## terminal
- [kitty](https://github.com/kovidgoyal/kitty)
- [catppuccin theme](https://raw.githubusercontent.com/catppuccin/kitty/main/macchiato.conf)

## editor
- [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

## shell
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)

## work
- [nodejs](https://nodejs.org/en/)
- [nvm](https://github.com/nvm-sh/nvm#installing-and-updating)


## misc
- [z](https://github.com/rupa/z)
- [fzf](https://github.com/junegunn/fzf)
- [ag](https://github.com/ggreer/the_silver_searcher)


# .files

This is my attempt to automate setup required for my daily frontend developer work.

## requirements

- [git](https://git-scm.com/)
- [nodejs](https://nodejs.org)

## vim
- [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- [clone dotfiles](https://github.com/alextrastero/dotfiles)
- `$ cd dotfiles && ./boo.sh` ?? chmod -x
- Install [go](https://go.dev/doc/install), [typescript language server](https://github.com/typescript-language-server/typescript-language-server) and [efm language server](https://github.com/mattn/efm-langserver)
- Open `nvim` and run `:PackerInstall`
- Restart `nvim`, `treesitter` should install dependencies

### issues

- When starting vim if python3 provider warning run:
  - `$ python3 -m ensurepip --upgrade`
  - `$ python3 -m pip install --user --upgrade pynvim`
- efm-langserver not available
  - make sure go path is added to PATH

## gnome
- [gnome tweaks](https://wiki.gnome.org/action/show/Apps/Tweaks) and setup Caps Lock as Ctrl
- [disable tap-and-drag](https://yildiz.dev/posts/gnome-disable-tap-and-drag) `gsettings set org.gnome.desktop.peripherals.touchpad tap-and-drag false`
- [flameshot](https://flameshot.org/) screenshot tool - set custom shortcut to `flameshot gui`
