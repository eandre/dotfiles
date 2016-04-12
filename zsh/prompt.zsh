autoload colors && colors

VIM_NORMAL="%{$fg_bold[yellow]%}N%{$reset_color%}"
VIM_INSERT="%{$fg_bold[cyan]%}I%{$reset_color%}"

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

export PROMPT='${VIM_INSERT} %{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}$(box_name)%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) %(?,,%{${fg_bold[white]}%}[%?]%{$reset_color%} )$ '

function set_prompt () {
    if [[ ! -n $KEYMAP ]]; then
        VIM_PROMPT="${VIM_INSERT}"
    else
        VIM_PROMPT="${${KEYMAP/(vicmd|opp)/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}"
    fi

    # Add virtualenv
    if [ -n "${VIRTUAL_ENV+x}" ]; then
        export RPROMPT='%{$fg[magenta]%}$(virtualenv_info)%{$reset_color%}'
    else
        export RPROMPT=""
    fi
    if [[ -n $SSH_CONNECTION ]]; then
        export PROMPT='${VIM_PROMPT} %{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}$(box_name)%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) %(?,,%{${fg_bold[white]}%}[%?]%{$reset_color%} )$ '
    else
        export PROMPT='${VIM_PROMPT} %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) %(?,,%{${fg_bold[white]}%}[%?]%{$reset_color%} )$ '
    fi
}

function zle-line-init zle-keymap-select {
    set_prompt
    zle reset-prompt
}

precmd() {
    title "zsh" "%m" "%55<...<%~"
    set_prompt
}

bindkey -v

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
