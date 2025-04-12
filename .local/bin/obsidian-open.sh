#!/bin/bash

# Set your vault name here
VAULT="Atomic"

# Get the full path to the file
FILE_PATH="$1"

# Extract path relative to the vault root
# Assuming your vault is mounted at /mnt/c/Users/you/Documents/ObsidianVault
VAULT_PATH="/mnt/c/chintan357/vaults/atomic"
RELATIVE_PATH="${FILE_PATH#$VAULT_PATH/}"

# URL encode the relative path
ENCODED_PATH=$(echo "$RELATIVE_PATH" | sed 's/ /%20/g' | sed 's/\//%2F/g')

# Construct the URI
URI="obsidian://open?vault=${VAULT}&file=${ENCODED_PATH}"

# Call Windows to open the URI
# powershell.exe start "$URI"
powershell.exe start "\"$URI\""
