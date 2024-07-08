# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Created by `pipx` on 2024-03-19 21:09:03
export PATH="$PATH:$HOME/.local/bin"

# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

# if [ -f "$HOME/.inputrc" ]; then
#   . "$HOME/.inputrc"
# fi

export HISTCONTROL=ignoredups
export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER="less -R --use-color -Dd+r -Du+b"

### SETTING OTHER ENVIRONMENT VARIABLES
if [ -z "$XDG_CONFIG_HOME" ] ; then
  export XDG_CONFIG_HOME="$HOME/.config"
fi
if [ -z "$XDG_DATA_HOME" ] ; then
  export XDG_DATA_HOME="$HOME/.local/share"
fi
if [ -z "$XDG_CACHE_HOME" ] ; then
  export XDG_CACHE_HOME="$HOME/.cache"
fi

safesource() {
  [[ -s $1 ]] && source $1
}

safesource /usr/local/etc/bash_completion.d/git-completion.bash
safesource /usr/local/etc/bash_completion.d/git-prompt.sh
safesource ~/.bash_profile.local
safesource "$HOME/.rvm/scripts/rvm"

# source '/home/chintan357/.config/nvm/versions/node/v21.7.1/lib/node_modules/@hyperupcall/autoenv/activate.sh'

source $HOME/.config/broot/launcher/bash/br

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
