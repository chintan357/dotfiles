```sh
sudo apt update && sudo apt -y upgrade

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# prefix + I

cd && mkdir -p lab/dotfiles wre pre lre hlab dotfiles private tmp down learn
# mkdir ~/.config

sudo apt install -y stow make cargo zoxide cmake xclip neofetch ripgrep fd-find bat pydf ncdu luarocks btop htop python3-pip gtypist net-tools tree jq bind9-dnsutils ufw nmap libssl-dev ffmpeg 7zip poppler-utils universal-ctags apt-transport-https python3.12-venv

mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
ln -s $(which fdfind) ~/.local/bin/fd

curl -LsSf https://astral.sh/uv/install.sh | sh

tools=(ruff ty datasette ipython pudb asciinema aider-chat ranger-fm thefuck jupyterlab jupyter-console yt-dlp)
# urlscan jupyter_client
for tool in "${tools[@]}"; do
  uv tool install "$tool"
done

llm install llm-gemini
# llm keys set gemini

# mise
curl https://mise.run | sh
mise use -g node@22
mise use -g rust@1.89.0

npm i -g open-cli @anthropic-ai/claude-code

cargo install cargo-binstall
# cargo binstall tealdeer --no-confirm
cargo binstall stylua tealdeer tree-sitter-cli eza git-delta hackernews_tui broot halp navi bob-nvim

bob use stable

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
curl -sfL https://direnv.net/install.sh | bash

# gcloud
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update && sudo apt-get install google-cloud-cli

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod u+x kubectl
mv kubectl ~/.local/bin

sudo add-apt-repository ppa:wslutilities/wslu
sudo apt update
sudo apt install wslu

# gh
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
        && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
        && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y

# gh-dash
# gh auth login
gh extension install dlvhdr/gh-dash
# gh extension install github/gh-copilot

# windows utility
cp /mnt/c/Windows/System32/cmd.exe ~/.local/bin
cp /mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/powershell.exe .local/bin/
cp /mnt/c/WINDOWS/Explorer.exe /home/chintan357/.local/bin/

https://docs.docker.com/engine/install/ubuntu/
https://cloud.google.com/sdk/docs/install#linux

# sqlite
wget https://www.sqlite.org/2025/sqlite-autoconf-3500100.tar.gz
tar xvfz sqlite-autoconf-3500100.tar.gz
cd sqlite-autoconf-3500100
./configure --prefix=/usr/local
make
sudo make install

curl -o ~/.git-prompt.sh \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
# contrib/completion/git-completion.bash

# tenv
LATEST_VERSION=$(curl --silent https://api.github.com/repos/tofuutils/tenv/releases/latest | jq -r .tag_name)
curl -O -L "https://github.com/tofuutils/tenv/releases/latest/download/tenv_${LATEST_VERSION}_amd64.deb"
sudo dpkg -i "tenv_${LATEST_VERSION}_amd64.deb"
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
# https://raw.githubusercontent.com/wfxr/forgit/main/bin/git-forgit
# https://raw.githubusercontent.com/wfxr/forgit/main/forgit.plugin.zsh

```
