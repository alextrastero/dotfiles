### dotfiles

I use linux (currently ubuntu & gnome), these are my required tools for front end development and general usage:


### Pre-requisits
`sudo apt install git curl`
`git clone <THIS REPO>`

#### install

- gnome-tweaks
- git
- nodejs
- [slack](https://slack.com/intl/en-gb/downloads/linux)
- [brave-browser](https://brave.com/linux/)
- [google-chrome](https://www.google.com/chrome/)
- [kitty terminal](https://sw.kovidgoyal.net/kitty/)
- tmux
- tig
- fzf
- [efm-langserver](https://github.com/mattn/efm-langserver)
- [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
- [oh-my-zsh](https://ohmyz.sh/#install)
- [rg](https://github.com/BurntSushi/ripgrep)
- [flameshot](https://flameshot.org/docs/installation/installation-linux/)
- [neovim](https://github.com/neovim/neovim/releases/) - in assets download "nvim-linux-x86_64.tar.gz"
- configure neovim python adapter:
    `sudo apt-get install python3-neovim`
    `sudo apt-get install build-essential`
- [fura mono font](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraMono/Regular/complete/Fura%20Mono%20Regular%20Nerd%20Font%20Complete.otf)
- [ag](https://github.com/ggreer/the_silver_searcher) (the_silver_searcher)
- [lf](https://github.com/gokcehan/lf) (list files)

git:
  ```
    git config --global --add push.default current
    git config --global --add push.autoSetupRemote true
  ```


##work

[nodejs](https://nodejs.org/en/)
[nvm](https://github.com/nvm-sh/nvm#installing-and-updating)


#### configure

- [setup SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- [add SSH key](https://github.com/settings/keys) to github/gitlab 
- [clone these dotfiles](https://github.com/alextrastero/dotfiles)
- create symbolic links (sudo ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim)
- clone [z.sh](https://github.com/rupa/z) into /opt/z
- map caps lock to ctrl
- add shortcuts super+b > browser super+t > kitty
- repeat keys speed
- start email client and slack on startup
- git config --global --add --bool push.autoSetupRemote true

#### npm packages

- eslint_d
- typescript
- yarn
- typescript-language-server
- nx

##### issues
- When starting vim if python3 provider warning run:
  - `$ python3 -m ensurepip --upgrade`
  - `$ python3 -m pip install --user --upgrade pynvim`
- efm-langserver not available
  - make sure go path is added to PATH



# SCRIPTS

talk about
- setting up custom shortcuts chrome/kitty/snapshots
- installing nodejs/nvm
- installing slack
- add to script zsh/oh-my-zsh install
	- zsh: sudo apt install zsh
- install neovim ? 
- alt is swapped with win in gnome-tweaks
- ctrl is mapped to caps lock in gnome-tweaks

## gnome-tweaks bckp

```ssh
  # bckup
    cd ~
    dconf dump / > saved_settings.dconf
  # restore
    cd ~
    dconf load -f / < saved_settings.dconf
```
