```sh
mkdir -p lab/dotfiles repo/{work,personal} homelab dotfiles private learn tmp down docs .config

sudo apt update && sudo apt -y upgrade

sudo apt install -y stow make cargo zoxide cmake urlview xclip neofetch ripgrep fd-find bat ncal pydf ncdu silversearcher-ag ranger luarocks btop htop python3-pip trash-cli gtypist cowsay cmatrix lolcat net-tools tree jq bind9-dnsutils ufw whois nmap libssl-dev ffmpeg 7zip poppler-utils fd-find imagemagick
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
wget -O ~/.local/bin/fzf-git.sh https://raw.githubusercontent.com/junegunn/fzf-git.sh/main/fzf-git.sh
wget -O ~/.local/bin/git-forgit https://raw.githubusercontent.com/wfxr/forgit/main/bin/git-forgit
wget -O ~/.local/bin/forgit.plugin.sh https://raw.githubusercontent.com/wfxr/forgit/main/forgit.plugin.zsh

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

```
