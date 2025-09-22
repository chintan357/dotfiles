if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

eval "$(direnv hook bash)"
eval "$(fzf --bash)" # FZF_ALT_C_COMMAND= 
eval "$(zoxide init bash)"
# eval "$(gh copilot alias -- bash)"
eval "$(uv generate-shell-completion bash)"
eval "$(uvx --generate-shell-completion bash)"

# safesource() {
#     [[ -s $1 ]] && source $1
# }

stty -ixon


# eval $(thefuck --alias fq)
# source $HOME/.config/broot/launcher/bash/br

# # Start the SSH agent if it's not running
# if [ -z "$SSH_AUTH_SOCK" ]; then
#     eval "$(ssh-agent -s)" > /dev/null
# fi
# # Add all SSH keys in ~/.ssh to the agent if not already added
# for key in ~/.ssh/*; do
#     # Check if the file is a private key (skip public keys and directories)
#     if [[ -f "$key" && "$key" != *.pub ]]; then
#         ssh-add -l | grep -q "$key" || ssh-add "$key" 2>/dev/null
#     fi
# done

. "$HOME/.local/share/../bin/env"
