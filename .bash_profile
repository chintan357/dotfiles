export PATH="$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin:$HOME/.fzf/bin:$HOME/.local/share/bob/nvim-bin:$PATH"

if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="/tmp/"

export LESS='-R --use-color'
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu nornu noma' -\""

export VISUAL=vi
export EDITOR=vi

# export OPENAI_API_KEY="$(head -1 ~/private/oanvim)"
export GOOGLE_API_KEY="$(head -1 ~/private/gemini-nvim)"

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

. "/home/chintan357/.local/share/bob/env/env.sh"
