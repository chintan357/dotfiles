alias e=exit
alias c=clear

alias al=alias

alias sudo='sudo '

alias cpr='cp -r'
alias rmr='rm -r'
alias rmrf='rm -rf'

alias ls='ls --color=auto'
alias la='ls -AF --group-directories-first'
alias ll='ls -AlhF --group-directories-first --color=always | less -RF'

# alias sctl='systemctl'
# alias bo='broot'
# clh() { curl localhost:$1; }
alias wt='watch' # -n 1

#-------#

alias chmx='chmod u+x'

alias release='cat /etc/*-release'

alias rp='realpath'
cprp() {
    realpath "$1" | xclip -selection clipboard
}

alias cpy="xclip -selection clipboard"

alias cpwd='pwd|cpy'

# alias path='cd "$(echo -e ${PATH//:/\\n} | fzf --preview "ls -la {}")"'

alias genpwd='< /dev/urandom tr -dc "A-Za-z0-9!@#$%^&*()_+-=" | head -c 24 | cpy'

alias plz='sudo $(history -p !!)'

alias myip='curl -s https://checkip.amazonaws.com'

alias gtypist='gtypist -c 0,2'

alias power='powershell.exe'

alias dira='direnv allow'

alias t='sesh connect $(sesh list | fzf)'

alias R=ranger

#-------#

alias v=nvim
alias vim='nvim'
alias lvi='nvim "+edit #<1"'
alias v.='nvim .'
# alias rmnvim='rm -rf ~/.config/nvim && rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim && rm -rf ~/.cache/nvim'
# alias lvim='NVIM_APPNAME="lvim" nvim'

#-------#

bak() { mv "$1" "$1.bak"; }
ubak() { mv "${1}.bak" "$1"; }

#-------#

# alias autorm='sudo apt -y autoremove && sudo apt autoclean'

alias show='apt show $1'
alias yupp='sudo apt install $1'
alias nope='sudo apt remove $1'

#-------#

alias erc='nvim ~/.bashrc'
alias epro='nvim ~/.bash_profile'
alias eal='nvim ~/.bash_aliases'
alias efunc='nvim ~/.bash_functions'
alias ein='nvim ~/.inputrc'
alias essh='nvim ~/.ssh/config'
alias evi='nvim ~/.vimrc'
alias etm='nvim ~/.tmux.conf'
alias eipy='nvim ~/.ipython/profile_default/ipython_config.py'
alias egit='nvim ~/.gitconfig'

#-------#

alias sorc="source ~/.bashrc"
alias soal="source ~/.bash_aliases"
alias sopro="source ~/.bash_profile"
alias soin="bind -f ~/.inputrc"

#-------#

alias cve='uv venv'
alias cvet='uv venv --python $1'
alias act="source .venv/bin/activate"
alias dact='deactivate'
alias sopy='cve && act'

alias uvr='uv run'
alias py='uv run $1'

alias uvi='uv init'
alias uvit='uv init --python $1'
alias uva='uv add'
alias uvad='uv add --dev'
alias uvrm='uv remove'
alias uvs='uv sync'
alias uvh='uv help'

alias uvp='uv python'
alias pyp='uv python pin'
# alias pyU='uv python uninstall'

alias ipython='ipython3'
alias ipy='ipython3'
alias ipyt='ipython3 --profile=tmp'
alias uvipy='uv run ipython3'

alias pyserver="uv run -m http.server"

# alias pkgpath='python3 -c "import sys; pkg=sys.argv[1]; import importlib; mod=importlib.import_module(pkg); print(getattr(mod, \"__path__\", [None])[0]) if getattr(mod, \"__path__\", None) else print(\"No __path__ attribute\")"'

#-------#

alias tm='tmux'
alias tmls='tmux ls'
alias tma='tmux attach'
alias tmkS='tmux kill-server'
alias tmpwd='s=$(basename "$PWD" | tr "." "_"); tmux new-session -Ad -s "$s" -c "$PWD" && tmux switch-client -t "$s"'

#-------#

alias bk="cd -"
alias ..="cd .."
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
# alias .4="cd ../../../.."

alias cdtmp='cd $(mktemp -d)'

alias mkcd='_mkcd() { mkdir -p "$1"; cd "$1"; }; _mkcd'
alias mk="mkdir -pv"

#-------#

alias cdssh='cd ~/.ssh'
alias cdnvim='cd ~/.config/nvim'
alias cdipy='cd ~/.ipython/profile_default'
alias conf='cd ~/.config'
alias tmp='cd ~/tmp'
alias pri='cd ~/private'
alias wre='cd ~/wre'
alias pre='cd ~/pre'
alias lre='cd ~/lre'
alias dls='cd ~/dls'
alias lab='cd ~/lab'
# alias hlab='cd ~/hlab'
alias dotfiles='cd ~/lre/dotfiles'
alias dot='cd ~/dotfiles'

alias iam='cd /mnt/c/atomic'
alias iamd='cd /mnt/c/atomic/dailies'

#-------#

alias pad='nvim /mnt/c/atomic/dailies/$(date +%Y-%m-%d.md)'
alias todo='nvim /mnt/c/atomic/inbox/todo.md'
alias todos='nvim /mnt/c/atomic/inbox/todos.md'
alias ask='nvim /mnt/c/atomic/inbox/ask.md'
alias dmp='nvim /mnt/c/atomic/inbox/dump.md'
alias week='nvim /mnt/c/atomic/inbox/week.md'

alias todoh='nvim todo.md'
alias padh='nvim pad.md'

alias exp="Explorer.exe ."
alias mntc='cd /mnt/c'
alias mntcu='cd /mnt/c/Users'
alias vaultsw='cd /mnt/c/vaults'

#-------#

alias oc='opencode'
alias ocp='opencode --port'

#-------#

alias g=git

[ -f /usr/share/bash-completion/completions/git ] && . /usr/share/bash-completion/completions/git
__git_complete g __git_main

# if [ -f "/usr/share/bash-completion/completions/git" ]; then
#   source /usr/share/bash-completion/completions/git
#   __git_complete g __git_main
# fi

alias lg=lazygit

alias gatom='gaa && gcm -m Atomic && gpu'

alias ginit='git init'
alias cg='cd `git rev-parse --show-toplevel`'

alias gaa='git add --all'
alias ga.='git add .'

alias gd='git diff'
alias gdc='git diff --cached'

alias gcl='git clone'
alias gcld='git clone --depth 1'

alias gbk='git checkout -'

alias gs='git status -sb'
alias gst='git status'

alias gamend='git commit --amend --no-edit'

alias gpu='git push'
alias gP='git pull'
alias gpr='git pull --rebase'

# alias gwc='git whatchanged'
# alias glast="git log -1 HEAD"

alias glg='git log --graph --oneline --decorate --all'

alias hbr='gh browse'
alias ghal='gh auth login'

#-------#

# alias lzd='lazydocker'
alias dk='docker'

alias dkps='docker ps'
alias dkpsa='docker ps -a'
alias dkbt='docker build -t'
alias dki='docker images'

#-------#

alias gaadl='gcloud auth application-default login'
alias gal='gcloud auth login'
alias gconfls='gcloud config configurations list'
alias gconfa='gcloud config configurations activate'

#-------#

alias deep='ssh deep'
alias dist='ssh dist'
alias smi='nvidia-smi'

alias chat='nvim -c ":CodeCompanionChat" -c ":only" -c "startinsert"'
alias chatf='nvim -c ":CodeCompanionChat adapter=openrouter model=openai/gpt-5.4-mini" -c ":only" -c "startinsert"'
alias chatl='nvim -c ":CodeCompanionChat adapter=openrouter model=openai/gpt-5.5" -c ":only" -c "startinsert"'

#-------#

source <(kubectl completion bash)
alias k='kubectl'
complete -F __start_kubectl k

alias ka='kubectl apply -f'
alias kdel='kubectl delete -f'
alias krf='kubectl replace --force -f'
alias kns='kubectl config set-context --current --namespace'
alias kcc='kubectl config current-context'

# alias rec='asciinema rec'
# alias play='asciinema play'
