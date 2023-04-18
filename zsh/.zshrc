export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="minimal"
plugins=(git yarn)
source $ZSH/oh-my-zsh.sh

#aliases
source $HOME/.aliases

export RIPGREP_CONFIG_PATH="$HOME/.rgconfig"

#z
#https://raw.githubusercontent.com/rupa/z/master/z.sh
# source $HOME/.z.sh
. /opt/z/z.sh

#start tmux
[ -z "$TMUX" ] && tmux

#nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#functions
function hub() { # Open github on folder
  nohup xdg-open $(git config remote.origin.url | ruby -ne 'puts "https://" + $_.split(%r{[/:@]})[1..-1].join("/").sub(/\.git$/, "")') >/dev/null 2>&1
}
function w() { # Open vim with git unchanged files
  $(git rev-parse --is-inside-work-tree 2>/dev/null) && vim $(git status --porcelain | awk '{print $2}')
}
unalias gbg
function gbg() {
  git checkout "$(git branch --sort=-committerdate | fzf| tr -d '[:space:]')"
}

#fzf config
export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ignore --pager less -g ""'
export FZF_DEFAULT_OPTS='--height 40% --info inline --border --preview "cat {}"'

#https://github.com/catppuccin/fzf/blob/main/macchiato.md
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39
--color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78
--color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export GEM_HOME="$HOME/gems"
export GOPATH="$HOME/go"

export PATH="$GEM_HOME/bin:$GOPATH/bin:$PATH"

export VISUAL=nvim
export EDITOR="$VISUAL"

alias luamake=/home/odella/lua-language-server/3rd/luamake/luamake
