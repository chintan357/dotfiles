# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
export PATH=$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin:$HOME/.fzf/bin:$PATH
export PATH=$HOME/.local/share/bob/nvim-bin:$PATH
export PATH=$HOME/.opencode/bin:$PATH

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="/tmp"

export LESS='-R --use-color'
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu nornu noma' -\""

export VISUAL=vi
export EDITOR=vi

export GOOGLE_API_KEY="$(head -1 ~/private/gemini-nvim)"
export TAVILY_API_KEY="$(head -1 ~/private/tavily)"
# export GOOGLE_SEARCH_API_KEY="$(head -1 ~/private/google-search)"
# export GOOGLE_SEARCH_ENGINE_ID="$(head -1 ~/private/google-search-engine-id)"
# export OPENAI_API_KEY="$(head -1 ~/private/oanvim)"

export PYTHONBREAKPOINT="ipdb.set_trace"
export RANGER_LOAD_DEFAULT_RC=FALSE

export BROWSER=wslview

export GIT_PS1_SHOWDIRTYSTATE=1
export FORGIT_COPY_CMD='xclip -selection clipboard'
export FORGIT_FZF_DEFAULT_OPTS="
--height 80% --tmux 90%,90%
--exact
--border
--cycle
--reverse
"

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --prompt="> " --color=dark --color=fg:-1,hl:#c678dd,fg+:#ffffff,hl+:#d858fe --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef'

export FZF_CTRL_T_OPTS=" --walker-skip .git,node_modules,target --preview 'bat -n --color=always {}' --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_CTRL_R_OPTS=" --preview 'echo {}' --preview-window up:3:hidden:wrap --bind 'ctrl-/:toggle-preview' --bind 'ctrl-y:execute-silent(echo -n {2..} | xclip -selection clipboard)+abort' --color header:italic --header 'Press CTRL-Y to copy command into clipboard'"
export FZF_ALT_C_OPTS=" --walker-skip .git,node_modules,target --preview 'tree -C {}'"
export FZF_TMUX_OPTS='-p80%,80%'
export FZF_COMPLETION_OPTS='--border --info=inline'

. "$HOME/.local/share/bob/env/env.sh"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return ;;
esac

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=9999
export HISTFILESIZE=19999

shopt -s histappend
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
# if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#     debian_chroot=$(cat /etc/debian_chroot)
# fi

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes ;;
esac

# if [ -x /usr/bin/dircolors ]; then
#     test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#     alias vdir='vdir --color=auto'
#     alias fgrep='fgrep --color=auto'
#     alias egrep='egrep --color=auto'
# fi

alias grep='grep --color=auto'

# colored GCC warnings and errors
# export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

export PROMPT_COMMAND='PS1_GIT=$(__git_ps1 "%s"); history -a; history -c; history -r;'
# export PROMPT_COMMAND='PS1_GIT=$(__git_ps1 "%s"); history -a; history -n;'
export PS1='\[\e[36m\]\w\[\e[0m\]\[\e[33m\]${PS1_GIT:+ (${PS1_GIT})}\[\e[0m\] '

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
bind -m vi-command '"\eo": "\C-z\ec\C-z"'
bind -m vi-insert '"\eo": "\C-z\ec\C-z"'
# bind -x '"\C-p": "vim $(fzf --height 40% --reverse)"'

source ~/.local/bin/fzf-git.sh
source ~/.local/bin/forgit.plugin.sh
source ~/.local/bin/.git-prompt.sh
# source $HOME/.tenv.completion.bash

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

eval "$(pyenv virtualenv-init -)"

eval "$(/home/chintan357/.local/bin/mise activate bash)"
