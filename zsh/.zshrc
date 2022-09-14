export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="minimal"
plugins=(git yarn)
source $ZSH/oh-my-zsh.sh

#aliases
source $HOME/.aliases

#z
#https://raw.githubusercontent.com/rupa/z/master/z.sh
source $HOME/z/z.sh

#nvm
# TODO

#start tmux
[ -z "$TMUX" ] && tmux

#FZF
# TODO

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
