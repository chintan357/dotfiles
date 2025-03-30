export PATH="$PATH:$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin:$HOME/.fzf/bin"
# if [[ ! "$PATH" == */home/chintan357/.fzf/bin* ]]; then
#   PATH="${PATH:+${PATH}:}/home/chintan357/.fzf/bin"
# fi

if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

if [ -z "$XDG_CONFIG_HOME" ] ; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi
if [ -z "$XDG_DATA_HOME" ] ; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi
if [ -z "$XDG_CACHE_HOME" ] ; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi

export XDG_RUNTIME_DIR="/tmp/"

export LESS='-R --use-color -Dd+r$Du+b'
# export PAGER=$HOME/bin/vimpager
# alias less=$PAGER
# export MANPAGER="less -R --use-color -Dd+r -Du+b"
# export MANPAGER='vimpager'
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu nornu noma' -\""

export VISUAL=vi
export EDITOR=vi
export OPENAI_API_KEY="$(head -1 ~/private/oanvim)"
export PYTHONBREAKPOINT="ipdb.set_trace"
export RANGER_LOAD_DEFAULT_RC=FALSE
export BROWSER="/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe --profile-directory='Default'" #TODO: is this workinng?

safesource() {
    [[ -s $1 ]] && source $1
}

safesource /usr/local/etc/bash_completion.d/git-completion.bash
safesource /usr/local/etc/bash_completion.d/git-prompt.sh
safesource ~/.bash_profile.local
safesource "$HOME/.rvm/scripts/rvm"

# source "$HOME/.config/nvm/versions/node/v21.7.1/lib/node_modules/@hyperupcall/autoenv/activate.sh"

source $HOME/.config/broot/launcher/bash/br

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

stty -ixon


eval "$(fzf --bash)" # FZF_ALT_C_COMMAND= 
eval "$(zoxide init bash)"
eval "$(starship init bash)"
eval $(thefuck --alias fq)

source ~/.local/bin/fzf-git.sh
source ~/.local/bin/forgit.plugin.sh

eval "$(uv generate-shell-completion bash)"
eval "$(uvx --generate-shell-completion bash)"

. "$HOME/.local/share/../bin/env"
