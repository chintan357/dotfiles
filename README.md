```sh
mkdir -p lab/dotfiles repo/{work,personal} homelab dotfiles private learn tmp down docs .config

sudo apt update && sudo apt -y upgrade

sudo apt install -y stow make cargo zoxide cmake xclip neofetch ripgrep fd-find bat pydf ncdu luarocks btop htop python3-pip trash-cli gtypist cowsay cmatrix lolcat net-tools tree jq bind9-dnsutils ufw nmap libssl-dev ffmpeg 7zip poppler-utils universal-ctags

mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
ln -s $(which fdfind) ~/.local/bin/fd

# glow
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install glow

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install --lts
npm i -g open-cli

# sudo apt install pipx
curl -LsSf https://astral.sh/uv/install.sh | sh

tools=(ruff ipython trash-cli pudb asciinema aider-chat ranger-fm thefuck jupyterlab jupyter-console)
# urlscan jupyter_client
for tool in "${tools[@]}"; do
  uv tool install "$tool"
done

sudo apt remove rustc
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# rustup update
cargo install tealdeer
cargo install tree-sitter-cli
cargo install --locked navi
cargo install eza git-delta hackernews_tui broot halp

# git clone https://github.com/facebook/PathPicker.git
# cd PathPicker/debian
# ./package.sh
# ls ../pathpicker_*_all.deb
# sudo dpkg -i ../pathpicker_*_all.deb

# tmux
sudo apt remove tmux
wget https://github.com/tmux/tmux/releases/download/3.5a/tmux-3.5a.tar.gz
tar -zxf tmux-*.tar.gz
cd tmux-*/
sudo apt-get install libevent-dev ncurses-dev build-essential bison pkg-config
./configure
make && sudo make install

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# prefix + I

# build nvim from source
sudo apt -y install gettext
git clone --branch nightly --depth 1 https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
# CMAKE_INSTALL_PREFIX=~/.local
sudo make install

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# https://raw.githubusercontent.com/junegunn/fzf-git.sh/main/fzf-git.sh
# https://raw.githubusercontent.com/wfxr/forgit/main/bin/git-forgit
# https://raw.githubusercontent.com/wfxr/forgit/main/forgit.plugin.zsh

curl -sfL https://direnv.net/install.sh | bash

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

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
gh extension install dlvhdr/gh-dash

# windows utility
cp /mnt/c/Windows/System32/cmd.exe ~/.local/bin
cp /mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/powershell.exe .local/bin/
cp /mnt/c/WINDOWS/Explorer.exe /home/chintan357/.local/bin/

https://docs.docker.com/engine/install/ubuntu/
https://cloud.google.com/sdk/docs/install#linux
```
