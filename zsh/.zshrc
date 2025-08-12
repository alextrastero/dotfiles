export ZSH=$HOME/.oh-my-zsh

zstyle ':omz:alpha:lib:git' async-prompt no

ZSH_THEME="minimal"
# clone https://github.com/zsh-users/zsh-syntax-highlighting
# into .oh-my-zsh/custom/plugins
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

#aliases
source $HOME/.aliases

export RIPGREP_CONFIG_PATH="$HOME/.rgconfig"

#z
#https://raw.githubusercontent.com/rupa/z/master/z.sh
# source $HOME/.z.sh
. /opt/z.sh

#start tmux
[ -z "$TMUX" ] && tmux

#nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#functions
function hub() {
  # Retrieve the remote origin URL of the Git repository
  remote_url=$(git config remote.origin.url)

  # Process the URL to convert it to HTTPS format suitable for opening in a browser
  browser_url=$(echo "$remote_url" | sed -E 's#(git@|https://)([^:/]+)[:/]#https://\2/#; s/\.git$//')

  # Open the processed URL in the default web browser using xdg-open
  nohup xdg-open "$browser_url" > /dev/null 2>&1
}
function w() { # Open vim with git unchanged files
  $(git rev-parse --is-inside-work-tree 2>/dev/null) && vim $(git status --porcelain | awk '{print $2}')
}

unalias gbg
function gbg() {
  git checkout "$(git branch --sort=-committerdate | fzf | tr -d '[:space:]')"
}

function fixup() {
  git rebase -i $(git merge-base HEAD master)
}

# update current branch with master
function update() {
  local main_branch # main or master
  if git show-ref --verify --quiet refs/heads/main; then
    main_branch="main"
  else
    main_branch="master"
  fi

  git checkout "$main_branch" && \
  git pull && \
  git checkout - && \
  git rebase -
}

function agv() {
  local word="$1"
  if [[ -z "$word" ]]; then
    echo "Find word and open files in vim\nUsage: agv <word>"
    return 1
  fi
  local files=$(ag -l "$word")
  if [[ -n "$files" ]]; then
    vim $(echo "$files" | tr '\n' ' ')
  else
    echo "No files found containing '$word'"
  fi
}

function blame() {
  if [[ -z "$1" ]]; then
    echo "Usage: blame <word>"
    return 1
  fi
  git log -S"$1" -p
}

# enable keybindings
source /usr/share/doc/fzf/examples/key-bindings.zsh
# config
export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ignore -g ""'
export FZF_DEFAULT_OPTS='--height 40%'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export GEM_HOME="$HOME/gems"
export GOPATH="/usr/local/go"

export PATH="$GEM_HOME/bin:$GOPATH/bin:$PATH"

export VISUAL="nvim"
export EDITOR="$VISUAL"

export OPENAI_API_KEY=

# Check if 'batcat' exists
if command -v batcat &>/dev/null; then
  export PAGER='batcat --paging=always'
fi
