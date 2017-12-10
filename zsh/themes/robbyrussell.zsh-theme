
function prompt_char {
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '○'
}

function hg_prompt {

  hg log -r . --template ' hg:({branch}:{bookmarks}) ' 2> /dev/null | sed 's/\:)/)/'

}


function repository_prompt_info {
  if [ $(in_hg) ]; then
    echo $(hg_prompt)
  else
    echo $(git_prompt_info)
  fi
}


local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(repository_prompt_info) $(prompt_char) '


ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

ZSH_THEME_HG_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_HG_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_HG_PROMPT_CLEAN="%{$fg[blue]%})"
