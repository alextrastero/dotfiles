PROMPT=$'%{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)$(bzr_prompt_info)%{$reset_color%}
%{$FG[002]%}▹%{$reset_color%} '

ZSH_THEME_SCM_PROMPT_PREFIX="%{$FG[008]%}"
ZSH_THEME_GIT_PROMPT_PREFIX=$ZSH_THEME_SCM_PROMPT_PREFIX
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}⚡️%{$FG[008]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
