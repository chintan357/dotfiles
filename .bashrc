export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

export PATH=$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin:$HOME/.fzf/bin:$PATH
export PATH=$HOME/.local/share/bob/nvim-bin:$PATH
export PATH=$HOME/.opencode/bin:$PATH

export VISUAL=nvim
export EDITOR=nvim

# export BROWSER=Explorer.exe

export PYTHONBREAKPOINT="ipdb.set_trace"

# export RANGER_LOAD_DEFAULT_RC=FALSE

export GIT_PS1_SHOWDIRTYSTATE=1

# source ~/.git-prompt.sh
export PROMPT_COMMAND='history -a' # history -n
PS1='\[\e[36m\]\w\[\e[0m\]$(__git_ps1 " \[\e[33m\](%s)\[\e[0m\]") '

HISTCONTROL=ignoreboth:erasedups
HISTSIZE=50000
HISTFILESIZE=100000

shopt -s histappend
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# case "$TERM" in
#     xterm-color|*-256color) color_prompt=yes ;;
# esac

# if [ -x /usr/bin/dircolors ]; then
#     test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#     alias vdir='vdir --color=auto'
#     alias fgrep='fgrep --color=auto'
#     alias egrep='egrep --color=auto'
# fi

# colored GCC warnings and errors
# export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# Source goto
# [[ -s "/usr/local/share/goto.sh" ]] && source /usr/local/share/goto.sh

# source $HOME/.config/broot/launcher/bash/br

bind -m vi-insert '"\eo": "\C-z\ec\C-z"'

export FZF_DEFAULT_OPTS='--layout=reverse --info=inline --ansi'
export FZF_ALT_C_OPTS="--preview 'tree -a -C -L 2 {}'"

fzf_to_nvim() {
    local file root
    if root=$(git rev-parse --show-toplevel 2>/dev/null); then
        file=$(git -C "$root" ls-files --cached --others --exclude-standard | fzf)
        [[ -n $file ]] && nvim "$root/$file"
    else
        file=$(fd --type f | fzf)
        [[ -n $file ]] && nvim "$file"
    fi
}
bind -m vi-insert -x '"\C-p": fzf_to_nvim'

# source ~/.local/bin/fzf-git.sh

export PATH=$PATH:/mnt/c/Users/ChintanPatel/AppData/Local/Programs/Zed/bin
