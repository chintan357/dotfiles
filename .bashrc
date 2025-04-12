# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return ;;
esac

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

PROMPT_COMMAND='PS1_GIT=$(__git_ps1 "%s")'
PS1='\[\e[36m\]\w\[\e[0m\]\[\e[33m\] ${PS1_GIT:+(${PS1_GIT})}\[\e[0m\] '

# . ~/.bash.d/cht.sh

# export NVM_DIR="$HOME/.config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# source '$HOME/.config/nvm/versions/node/v21.7.1/lib/node_modules/@hyperupcall/autoenv/activate.sh'

# Source goto
# [[ -s "/usr/local/share/goto.sh" ]] && source /usr/local/share/goto.sh

# source "$HOME"/.oh-my-git/prompt.sh

# if type rg &> /dev/null; then ... fi
# export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS=' --height 40% --layout=reverse --border --prompt="> " --color=dark --color=fg:-1,hl:#c678dd,fg+:#ffffff,hl+:#d858fe --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef'

# export FZF_DEFAULT_OPTS='--height 40% --tmux bottom,40% --layout reverse --border top'
# export FZF_DEFAULT_OPTS='--color=bg+:#292e42,bg:#16161e,border:#1f2335,hl:#ff9e64,fg:#a9b1d6,header:#292e42,pointer:#bb9af7,fg+:#a9b1d6,preview-bg:#24283b,prompt:#7dcfff,hl+:#7aa2f7,info:#e0af68'

export FZF_CTRL_T_OPTS=" --walker-skip .git,node_modules,target --preview 'bat -n --color=always {}' --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_CTRL_R_OPTS=" --preview 'echo {}' --preview-window up:3:hidden:wrap --bind 'ctrl-/:toggle-preview' --bind 'ctrl-y:execute-silent(echo -n {2..} | xclip -selection clipboard)+abort' --color header:italic --header 'Press CTRL-Y to copy command into clipboard'"
export FZF_ALT_C_OPTS=" --walker-skip .git,node_modules,target --preview 'tree -C {}'"

export FZF_TMUX_OPTS='-p80%,80%'

export FZF_COMPLETION_OPTS='--border --info=inline'

# _fzf_compgen_file() {
#     fd --type f --hidden --follow --exclude ".git" . "$1"
# }

_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}
#
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

bind 'TAB:menu-complete'
bind '"\e[Z":menu-complete-backward'

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

# source $HOME/.config/broot/launcher/bash/br # TODO: is this needed?

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
