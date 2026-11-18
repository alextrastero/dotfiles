# Omarchy environment (OMARCHY_PATH + PATH), needed even for non-interactive shells
[[ -r /usr/share/omarchy/default/bash/env-bootstrap ]] && source /usr/share/omarchy/default/bash/env-bootstrap

# If not running interactively, don't do anything else (leave this above the rc source)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source "$OMARCHY_PATH/default/bash/rc"

source "$HOME/.aliases"

# Same as zsh. Omarchy's EDITOR (omarchy-launch-editor) passes args after `--`,
# so nvim opens `+LINE` from tig and others as a file instead of jumping to the line.
export VISUAL="nvim"
export EDITOR="$VISUAL"

# Clear kitty keyboard protocol flags a TUI left pushed (omp leaks them when the
# pane resizes during shutdown), otherwise Ctrl+C arrives as `9;5u` and Esc as `u`.
# Terminals without the protocol ignore the sequence.
PROMPT_COMMAND+=("printf '\e[<99u'")
