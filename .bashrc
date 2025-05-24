# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return ;;
esac

HISTCONTROL=ignoreboth:erasedups
HISTSIZE=9999
HISTFILESIZE=19999

shopt -s histappend
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes ;;
esac


if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# "history -a; history -n"
# PROMPT_COMMAND='PS1_GIT=$(__git_ps1 "%s")'
PS1_GIT=$(__git_ps1 "%s")
PS1='\[\e[36m\]\w\[\e[0m\]\[\e[33m\] ${PS1_GIT:+(${PS1_GIT})}\[\e[0m\] '

# Source goto
# [[ -s "/usr/local/share/goto.sh" ]] && source /usr/local/share/goto.sh

# _fzf_compgen_file() {
#     fd --type f --hidden --follow --exclude ".git" . "$1"
# }

_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}

_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
        cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
        export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
        ssh)          fzf --preview 'dig {}'                   "$@" ;;
        *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
    esac
}

_fzf_git_fzf() {
  fzf --height 50% --tmux 90%,70% \
    --layout reverse --multi --min-height 20+ --border \
    --no-separator --header-border horizontal \
    --border-label-pos 2 \
    --color 'label:blue' \
    --preview-window 'right,50%' --preview-border line \
    --bind 'ctrl-/:change-preview-window(down,50%|hidden|)' "$@"
}

fzf_to_nvim() {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
# -C $(git rev-parse --show-toplevel) 
    local file=$(git ls-files --cached --others --exclude-standard | fzf --tmux 90%,70% --preview 'bat -n --color=always {}')
    # local file=$(git ls-files --cached --others --exclude-standard | fzf --preview 'cat {}' --preview-window=right:60%:wrap)
  else
    local file=$(find . -type f | fzf --tmux 90%,70% --preview 'cat {}' --preview-window=right:60%:wrap)
  fi
  
  if [ -n "$file" ]; then
    nvim "$file"
  fi
}

bind -x '"\C-p": fzf_to_nvim'
# bind -x '"\C-p": "vim $(fzf --height 40% --reverse)"'

bind -m vi-command '"\eo": "\C-z\ec\C-z"'
bind -m vi-insert '"\eo": "\C-z\ec\C-z"'
eval "$(direnv hook bash)"
