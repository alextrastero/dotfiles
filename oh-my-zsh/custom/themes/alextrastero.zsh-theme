local ret_status="%(?:%{$fg_bold[yellow]%}ʎ:%{$fg_bold[red]%}⌽)"
# PROMPT='${ret_status} $(npm -v) %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
PROMPT='${ret_status} %{$fg[white]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ✗"
