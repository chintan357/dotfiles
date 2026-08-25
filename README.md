```sh
sudo apt update && sudo apt -y upgrade

sudo apt install -y stow ripgrep htop tree bat fd-find gtypist bind9-dnsutils universal-ctags vim-gtk3 make ufw nmap ffmpeg jq build-essential xclip
# libssl-dev apt-transport-https cmake pydf ncdu btop 7zip duf python3-pip python3.12-venv xdg-utils

# sudo timedatectl set-timezone Asia/Kolkata

mkdir ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
ln -s $(which fdfind) ~/.local/bin/fd

cd && mkdir -p tmp lab hlab wre pre lre/dotfiles private dls
mv .bashrc .bashrc.bak

git clone https://github.com/cpatelco/dotfiles.git && cd dotfiles
stow .

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# prefix + I

curl -LsSf https://astral.sh/uv/install.sh | sh
tools=(ranger-fm yt-dlp) # urlscan jupyter_client pudb datasette asciinema thefuck jupyterlab jupyter-console
for tool in "${tools[@]}"; do
  uv tool install "$tool"
done

# mise
curl https://mise.run | sh
mise use -g node@lts rust go
mise use -g kubectl gcloud gh

cargo install cargo-binstall
cargo binstall bob-nvim git-delta
# cargo binstall --no-confirm
# broot halp navi tealdeer
# tree-sitter-cli

bob use stable

curl -o ~/.local/bin/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
# contrib/completion/git-completion.bash

go install github.com/joshmedeski/sesh/v2@latest
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
curl -sfL https://direnv.net/install.sh | bash
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
curl -fsSL https://opencode.ai/install | bash
curl -fsSL https://pi.dev/install.sh | sh
```

```sh
# windows utility
cp /mnt/c/Windows/System32/cmd.exe ~/.local/bin
cp /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe ~/.local/bin/
cp /mnt/c/Windows/Explorer.exe ~/.local/bin/

https://docs.docker.com/engine/install/ubuntu/
https://cloud.google.com/sdk/docs/install#linux

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# gh
gh auth login
gh extension install dlvhdr/gh-dash

https://raw.githubusercontent.com/junegunn/fzf-git.sh/main/fzf-git.sh
```
