```sh
mkdir -p lab/{dotfiles,scripts} repo homelab dotfiles vaults/nsal private tmp docs downloads .config

sudo apt update && sudo apt -y upgrade

sudo apt install -y stow make cargo zoxide cmake urlview xclip neofetch  ripgrep fd-find bat gh hub ncal  pydf ncdu silversearcher-ag ranger luarocks btop htop python3-pip trash-cli gtypist cowsay cmatrix lolcat net-tools tree jq bind9-dnsutils ufw whois nmap libssl-dev ffmpeg 7zip poppler-utils fd-find imagemagick
# glow
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install glow

mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
ln -s $(which fdfind) ~/.local/bin/fd

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install --lts
npm i -g open-cli

sudo apt install pipx

pxi ipython jupyterlab trash-cli black isort ipdb jupyter-console pudb pylint virtualenv tldr flake8 asciinema urlscan

sudo apt remove rustc
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# rustup update
cargo install --locked yazi-fm yazi-cli
cargo install tree-sitter-cli
cargo install --locked navi
cargo install eza git-delta hackernews_tui  broot halp

curl -sS https://starship.rs/install.sh | sh

git clone https://github.com/facebook/PathPicker.git
cd PathPicker/debian
./package.sh
ls ../pathpicker_*_all.deb
sudo dpkg -i ../pathpicker_*_all.deb

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

# nvim
sudo apt install gettext
git clone --branch nightly --depth 1 https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# pyenv
curl https://pyenv.run | bash

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# this uses older python version
sudo snap install thefuck --beta --classic
```
