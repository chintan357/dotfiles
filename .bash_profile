if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

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
