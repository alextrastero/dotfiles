export ZSH=$HOME/.oh-my-zsh

zstyle ':omz:alpha:lib:git' async-prompt no

ZSH_THEME="minimal"
plugins=(git yarn)
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
  git checkout "$(git branch --sort=-committerdate | fzf| tr -d '[:space:]')"
}

function fixup() {
  git rebase -i $(git merge-base HEAD master)
}

# FZF
# enable keybindings
source /usr/share/doc/fzf/examples/key-bindings.zsh
# config
export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ignore --pager less -g ""'
export FZF_DEFAULT_OPTS='--height 40% --info inline --border --preview "cat {}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export GEM_HOME="$HOME/gems"
export GOPATH="$HOME/go"

export PATH="$GEM_HOME/bin:$GOPATH/bin:$PATH"

export VISUAL=nvim
export EDITOR="$VISUAL"

# gfix function - performs a 'fixup' operation on a selected commit in the repository history
# Steps:
# 1. Presents the user with a list of commits (in reverse order) from which to choose.
# 2. Upon selection, a 'fixup' commit is created for the chosen commit.
# 3. Depending on the chosen commit, it then performs an interactive rebase:
#    a) If the chosen commit is the first commit (root), a rebase is performed for all commits down to the root.
#    b) If the chosen commit is not the root, a regular rebase is performed from the chosen commit upwards.
function gfix() {
  # Get the list of commits
  IFS=$'\n'
  commits=($(git rev-list --abbrev-commit --pretty=oneline HEAD))

  # Check if an argument is provided
  if [ -z "$1" ]; then
    # Print the commits and ask the user to select one
    echo "Please select a commit:"
    select commit in "${commits[@]}"; do
      if [ -n "$commit" ]; then
        # Extract the hash from the selected commit
        commit_hash=$(echo $commit | awk '{print $1}')
        break
      else
        echo "Invalid selection"
      fi
    done
  else
    commit_hash=$1
  fi

  git commit --fixup "$commit_hash"

  # Check if the selected commit is the first commit
  if git rev-parse "$commit_hash"^ >/dev/null 2>&1; then
    # It's not the first commit, so we can use the normal rebase
    GIT_SEQUENCE_EDITOR=":" git rebase -i --autosquash "$commit_hash"^
  else
    # It's the first commit, so we use --root
    GIT_SEQUENCE_EDITOR=":" git rebase -i --root --autosquash
  fi
}
