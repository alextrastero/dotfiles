export ZSH=$HOME/.oh-my-zsh

zstyle ':omz:alpha:lib:git' async-prompt no

ZSH_THEME="minimal"
# zsh-syntax-highlighting must be cloned into .oh-my-zsh/custom/plugins
# https://github.com/zsh-users/zsh-syntax-highlighting
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

source $HOME/.aliases

export RIPGREP_CONFIG_PATH="$HOME/.rgconfig"

# z — https://github.com/rupa/z
. /opt/z.sh

# start herdr
[ -z "$HERDR_ENV" ] && "$HOME/.local/bin/herdr"

# nvm (lazy-loaded: sourcing nvm.sh adds ~0.5s to every new shell/pane)
# put the newest installed node on PATH, load nvm itself on first use
export NVM_DIR="$HOME/.nvm"
_nvm_node=("$NVM_DIR"/versions/node/*(N/nOn[1]))
[ -n "$_nvm_node" ] && export PATH="$_nvm_node/bin:$PATH"
unset _nvm_node
function nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}

# fzf
source /usr/share/doc/fzf/examples/key-bindings.zsh
export FZF_DEFAULT_COMMAND='rg --files --ignore-file ~/.ignore'
export FZF_DEFAULT_OPTS='--height 40%'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export GEM_HOME="$HOME/gems"
export GOROOT="/usr/local/go"
export GOPATH="$HOME/go"

export PATH="$GEM_HOME/bin:$HOME/.local/bin:$GOROOT/bin:$GOPATH/bin:$PATH:$HOME/.hunk/bin"

export VISUAL="nvim"
export EDITOR="$VISUAL"

if command -v batcat &>/dev/null; then
  export PAGER='batcat --paging=always'
fi

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

# local overrides (not tracked in git)
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

