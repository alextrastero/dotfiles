# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Zsh to use the same colors as ls
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu yes select
# zstyle ':completion:*:warnings' format '✖︎'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="frisk"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

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
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-completions)

. ~/.oh-my-zsh/plugins/z/z.sh

autoload -U compinit && compinit

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# ///////////////// ALIASES ///////////////////////////////////////////////////
# Go to project folder
alias gogo="cd ~/dev/lessonnine/"
# Go to dev folder
alias dev="cd ~/dev"
# Update git submobules
alias update="git submodule update"
alias freshstart="git fetch origin master && git reset --hard origin/master"
# Open my github page in browser
# alias hub="open https://github.com/lessonnine/core.spa"
function hub() {
  open $(git config remote.origin.url | ruby -ne 'puts "https://" + $_.split(%r{[/:@]})[1..-1].join("/").sub(/\.git$/, "")')
}

alias watch="webpack-dev-server --progress --colors"
# Show used ports
alias ports="lsof -i -P | grep -i 'listen'"
alias gs='git show'
# Uncommit last commit and unstage - to see all new stuff in vim-git
alias gundo='git reset --soft HEAD~ && git reset HEAD .'
# Show random cat gif in terminal (requires imgcat script and iTerm3 nightly)
alias catnip='curl -s http://edgecats.net/first | imgcat'
alias edit='vim ~/dev/dotfiles/.vimrc'
alias find='open https://github.com/wimdu/wimdu/find/master'

alias gb="git branch --sort=committerdate"
alias vim="nvim"
alias hello="~/dev/dotfiles/startup"
alias bye="~/dev/lessonnine/shutdown"
alias colors='for code in {000..15}; do print -P -- "$code: %F{$code}Test%f"; done'
alias c='clear'
alias tree='tree -d'
function own() {
  sudo chown -v aodell $1
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export TERM=xterm-256color
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# eval "$(rbenv init -)"

# Don't autocomplete some stuff
zstyle ':completion:*:functions' ignored-patterns '_*'

[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
