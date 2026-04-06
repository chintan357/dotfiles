```sh
sudo apt update && sudo apt -y upgrade

sudo apt install -y stow zoxide ripgrep htop tree bat fd-find gtypist bind9-dnsutils universal-ctags vim-gtk3 make ufw nmap ffmpeg jq build-essential
# libssl-dev apt-transport-https cmake pydf ncdu btop 7zip duf python3-pip python3.12-venv xdg-utils xclip 

# sudo timedatectl set-timezone Asia/Kolkata

ln -s /usr/bin/batcat ~/.local/bin/bat
ln -s $(which fdfind) ~/.local/bin/fd

cd && mkdir -p tmp lab hlab wre pre lre/dotfiles private dls
mv .bashrc .bashrc.bak

git clone https://github.com/chintan357/dotfiles.git && cd dotfiles
stow .

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# prefix + I

curl -LsSf https://astral.sh/uv/install.sh | sh
tools=(ruff ty ipython ranger-fm yt-dlp) # urlscan jupyter_client pudb datasette asciinema thefuck jupyterlab jupyter-console
for tool in "${tools[@]}"; do
  uv tool install "$tool"
done

# mise
curl https://mise.run | sh
mise use -g node@lts rust@latest go@latest

cargo install cargo-binstall
cargo binstall git-delta bob-nvim
# cargo binstall --no-confirm
# eza navi broot halp hackernews_tui stylua 
# tree-sitter-cli tealdeer

bob use stable

curl -o ~/.git-prompt.sh \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
# contrib/completion/git-completion.bash

go install github.com/joshmedeski/sesh/v2@latest

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

curl -sfL https://direnv.net/install.sh | bash

curl -fsSL https://opencode.ai/install | bash
curl -fsSL https://pi.dev/install.sh | sh
```

```sh
# windows utility
cp /mnt/c/Windows/System32/cmd.exe ~/.local/bin
cp /mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/powershell.exe .local/bin/
cp /mnt/c/WINDOWS/Explorer.exe /home/chintan357/.local/bin/

https://docs.docker.com/engine/install/ubuntu/
https://cloud.google.com/sdk/docs/install#linux

# kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod u+x kubectl
mv kubectl ~/.local/bin

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# gcloud
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update && sudo apt-get install google-cloud-cli

# gh
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
        && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
        && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y
# gh auth login
# gh extension install dlvhdr/gh-dash

# sqlite
wget https://www.sqlite.org/2025/sqlite-autoconf-3500100.tar.gz
tar xvfz sqlite-autoconf-3500100.tar.gz
cd sqlite-autoconf-3500100
./configure --prefix=/usr/local
make
sudo make install
```


```sh
# git clone https://github.com/facebook/PathPicker.git
# cd PathPicker/debian
# ./package.sh
# ls ../pathpicker_*_all.deb
# sudo dpkg -i ../pathpicker_*_all.deb

# tmux
# sudo apt remove tmux
# wget https://github.com/tmux/tmux/releases/download/3.5a/tmux-3.5a.tar.gz
# tar -zxf tmux-*.tar.gz
# cd tmux-*/
# sudo apt-get install libevent-dev ncurses-dev build-essential bison pkg-config
# ./configure
# make && sudo make install

# https://raw.githubusercontent.com/junegunn/fzf-git.sh/main/fzf-git.sh

# tenv
# LATEST_VERSION=$(curl --silent https://api.github.com/repos/tofuutils/tenv/releases/latest | jq -r .tag_name)
# curl -O -L "https://github.com/tofuutils/tenv/releases/latest/download/tenv_${LATEST_VERSION}_amd64.deb"
# sudo dpkg -i "tenv_${LATEST_VERSION}_amd64.deb"
```
