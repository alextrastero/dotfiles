# zmodload zsh/zprof # debuggin
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster"
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  fasd
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Start fasd_cd

eval "$(command fasd --init auto)"

# Set tmux colors ?
[ -z "$TMUX" ] && export TERM="xterm-256color"
if [ "$TMUX" = "" ]; then tmux; fi

# ///////////////// ALIASES ////////////////////////////////////////////////////
alias dev="cd ~/dev" # Go to dev folder
alias pick="git cherry-pick"
alias ports="lsof -i -P | grep -i 'listen'" # List used ports
alias gs="git show"
alias gundo='git reset --soft HEAD~ && git reset HEAD .' # Uncommit last commit and unstage - to see all new stuff in vim-git
alias edit='vim $HOME/dev/dotfiles/.vimrc'
alias gch='function _blah(){ git rev-list --count HEAD ^$1; };_blah' # Git count commits from param branch
alias gll="gfa && gf -p && gl"
alias colors='for code in {000..15}; do print -P -- "$code: %F{$code}Test%f"; done'
alias z="fasd_cd -d"
alias c="clear"
alias gitprune='git branch | xargs git branch -d'
alias git-sync-tags='git tag | xargs git tag -d && git fetch --tags'
alias glg="tig log -n20"
alias ip="ipconfig getifaddr en0 | pbcopy && echo 'IP copied'"
alias gb="git branch --sort=-committerdate --column"

# ///////////////// FUNCTIONS //////////////////////////////////////////////////

function hub() { # Open github on folder
  open $(git config remote.origin.url | ruby -ne 'puts "https://" + $_.split(%r{[/:@]})[1..-1].join("/").sub(/\.git$/, "")')
}

function show() { # Open github on comparing current branch with master
  branch=$(current_branch)
  open "https://github.com/lessonnine/lesson-player.spa/compare/$branch?expand=1"
}

function own() { # Own a file $1
  sudo chown -v $(whoami) $1
}

export GIT_EDITOR="vim"

# Speed up oh-my-zsh
export DISABLE_UPDATE_PROMPT=true

# FZF
export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ignore --pager less -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# https://www.topbug.net/blog/2016/09/27/make-gnu-less-more-powerful/
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --no-init --window=-4'

alias ag="ag --path-to-ignore ~/.ignore --pager less"
alias gc="git commit -v -S"
alias gamend="git commit --amend --no-edit"
alias dl="youtube-dl -x --audio-format mp3"
alias unit="npm run test:unit"
alias watch="npm run test:unit:watch -- --noStackTrace --verbose false"
alias fixup="git rebase -i origin/HEAD"
alias p="python3"
alias update="gco develop;gll;gco -;git rebase -" # NOTE develop

# rebasing aliases
alias rec="git rebase --continue"
alias res="git rebase --skip"
alias rei="git rebase -i"

# commit tempo
alias tempo="git add .; git commit -m tempo"
alias merge="git add .; git commit -m 'merge this'"
alias preview="git add . -N && git diff HEAD"

# Better autocomplete?
zle -C complete-menu menu-select _generic
  _complete_menu() {
    setopt localoptions alwayslastprompt
    zle complete-menu
  }
bindkey -M menuselect '^M' .accept-line

export PATH="/usr/local/sbin:$PATH"

alias t="yarn test"
alias s="yarn start"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export CYPRESS_CRASH_REPORTS=0

alias gst="clear; git status"

# clean up local branches
alias gprune="git branch --merged | egrep -v \"(^\*|master|dev)\" | xargs git branch -d"

alias fix="yarn lint --fix"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
