export PATH="$PATH:$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin:$HOME/.fzf/bin"

if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
# export XDG_RUNTIME_DIR="/tmp/"

export LESS='-R --use-color'
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu nornu noma' -\""

export VISUAL=vi
export EDITOR=vi

export OPENAI_API_KEY="$(head -1 ~/private/oanvim)"

export PYTHONBREAKPOINT="ipdb.set_trace"
export RANGER_LOAD_DEFAULT_RC=FALSE

export BROWSER=wslview

safesource() {
    [[ -s $1 ]] && source $1
}

stty -ixon

eval "$(fzf --bash)" # FZF_ALT_C_COMMAND= 
eval "$(zoxide init bash)"

source ~/.local/bin/fzf-git.sh
source ~/.local/bin/forgit.plugin.sh

eval "$(uv generate-shell-completion bash)"
eval "$(uvx --generate-shell-completion bash)"

# eval $(thefuck --alias fq)
# source $HOME/.config/broot/launcher/bash/br
