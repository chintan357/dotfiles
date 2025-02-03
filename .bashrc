# ~/.bashrc: executed by bash(1) for non-login shells
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return ;;
esac

# HISTCONTROL=ignoreboth
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
HISTSIZE=9999
HISTFILESIZE=19999

# shopt -s cmdhist

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
# shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes ;;
esac


# enable color support of ls and also add handy aliases
# if [ -x /usr/bin/dircolors ]; then
#     test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#     # alias ls='ls --color=auto'
#     alias dir='dir --color=auto'
#     alias vdir='vdir --color=auto'
#
#     alias grep='grep --color=auto'
#     alias fgrep='fgrep --color=auto'
#     alias egrep='egrep --color=auto'
# fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
# if ! shopt -oq posix; then
#   if [ -f /usr/share/bash-completion/bash_completion ]; then
#     . /usr/share/bash-completion/bash_completion
#   elif [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
#   fi
# fi


# set nvim as default text editor
export VISUAL=vim
export EDITOR=vim

# Created by `pipx` on 2024-03-19 21:09:03
# . ~/.bash.d/cht.sh to ~/.bashrc
export PATH="$PATH:$HOME/.local/bin:$HOME/bin:$HOME/.config/.scripts:$HOME/.cargo/bin:$HOME/.tmux/plugins/tmux-session-wizard/bin"

# export NVM_DIR="$HOME/.config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# source '$HOME/.config/nvm/versions/node/v21.7.1/lib/node_modules/@hyperupcall/autoenv/activate.sh'

# Source goto
# [[ -s "/usr/local/share/goto.sh" ]] && source /usr/local/share/goto.sh

# source "$HOME"/.oh-my-git/prompt.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_CTRL_T_OPTS=" --walker-skip .git,node_modules,target --preview 'bat -n --color=always {}' --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_CTRL_R_OPTS=" --preview 'echo {}' --preview-window up:3:hidden:wrap --bind 'ctrl-/:toggle-preview' --bind 'ctrl-y:execute-silent(echo -n {2..} | xclip -selection clipboard)+abort' --color header:italic --header 'Press CTRL-Y to copy command into clipboard'"
export FZF_ALT_C_OPTS=" --walker-skip .git,node_modules,target --preview 'tree -C {}'"

export FZF_TMUX_OPTS='-p80%,80%'

export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_DEFAULT_OPTS=' --height 40% --layout=reverse --border --prompt="> "'
# export FZF_DEFAULT_OPTS='--color=bg+:#292e42,bg:#16161e,border:#1f2335,hl:#ff9e64,fg:#a9b1d6,header:#292e42,pointer:#bb9af7,fg+:#a9b1d6,preview-bg:#24283b,prompt:#7dcfff,hl+:#7aa2f7,info:#e0af68'

# if type ag &> /dev/null; then
#     export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
# fi

#refer rg over ag
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

_fzf_compgen_file() {
    fd --type f --hidden --follow --exclude ".git" . "$1"
}

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


# function yy() {
#     local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
#     yazi "$@" --cwd-file="$tmp"
#     if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
#         cd -- "$cwd" || exit
#     fi
#     rm -f -- "$tmp"
# }

# if [ -f "$HOME"/.config/hub.bash_completion.sh ]; then
#     . "$HOME"/.config/hub.bash_completion.sh
# fi

bind 'TAB:menu-complete'
bind '"\e[Z":menu-complete-backward'

# c() { cd ~/code/$1; }
# h() { cd ~/$1; }

eval "$(navi widget bash)"
eval "$(fzf --bash)"
eval "$(zoxide init bash)"
eval "$(starship init bash)"
eval $(thefuck --alias fq)
eval "$(pyenv virtualenv-init -)"

# Start the SSH agent if it's not running
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)" > /dev/null
fi
# Add all SSH keys in ~/.ssh to the agent if not already added
for key in ~/.ssh/*; do
    # Check if the file is a private key (skip public keys and directories)
    if [[ -f "$key" && "$key" != *.pub ]]; then
        ssh-add -l | grep -q "$key" || ssh-add "$key" 2>/dev/null
    fi
done

export OPENAI_API_KEY="$(head -1 ~/private/oanvim)"
# . "$HOME/.cargo/env"

source /home/chintan357/.config/broot/launcher/bash/br

export BROWSER="/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe --profile-directory='Default'"
export XDG_RUNTIME_DIR="/tmp/"
