# Current directory.
# Return only three last items of path
__current_dir() {
  echo -n "%{$fg[blue]%}"
  echo -n "%3~ %{$reset_color%}"
}
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}] %{$fg[yellow]%}⚡%{$reset_color%}"

PROMPT='$(__current_dir)'

RPROMPT='%{$fg[blue]%}$(git_prompt_info)%{$reset_color%} $(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[030]%} ♛ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[060]%}♜ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[090]%} ✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[110]%} ➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[140]%} ✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[150]%}♞ "
