alias e=exit
alias c=clear

alias al=alias
alias ual=unalias

#-----------#

alias cpr='cp -r'
alias rmr='rm -r'
alias rmrf='rm -rf'

#-----------#

alias bo='broot'

alias la='ls -A --group-directories-first --color=auto'
alias ll='ls -Alh --group-directories-first --color=always | less -RF'
alias lsd='ls -d */ --color=auto 2> /dev/null'
alias lh='ls -d .[^.]* --color=auto 2> /dev/null'
alias lt='tree -a -L 2 -C | less -RF'

alias es='eza --group-directories-first'
alias ea='eza -a --git --color=always --icons=always --group-directories-first'
alias el='eza -Alh --git --color=always --icons=always --group-directories-first | less'
alias et='eza -a --tree --level=2'

#-----------#

alias grepi='grep -i'
alias grepir='grep -ir'

#-----------#

alias chownr='chown -R'
alias chmodr='chmod -R'
alias chmx='chmod u+x'

#-----------#

alias psx="ps auxf"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

alias freeh='free -h'

alias p1='ping -c 3 1.1.1.1'
alias p8='ping -c 3 8.8.8.8'
clh() { curl localhost:$1; }

#-----------#

alias dfh='df -h'

alias osrel='cat /etc/os-release'
alias release='cat /etc/*-release'

#-----------#

alias rp='realpath'
alias cprp='sh -c '\''realpath "$1" | xclip -selection clipboard'\'' -'

alias cpy="xclip -selection clipboard"
alias CC='$(fc -l -n -1) | cpy'
alias cpwd='pwd|cpy'

# alias path='cd "$(echo -e ${PATH//:/\\n} | fzf)"'
alias path='cd "$(echo -e ${PATH//:/\\n} | fzf --preview "ls -la {}")"'

# alias genpwd='openssl rand -base64 16 | cpy'
alias genpwd='< /dev/urandom tr -dc "A-Za-z0-9" | head -c 20 | cpy'
alias plz="fc -l -1 | cut -d' ' -f2- | xargs sudo"

#-----------#

alias v=nvim
alias vim='nvim'
alias lvi='nvim -c "normal '\''0"'
alias v.='nvim .'
alias rmnvim='rm -rf ~/.config/nvim && rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim && rm -rf ~/.cache/nvim'
# alias v='NVIM_APPNAME="tvim" nvim'
alias lvim='NVIM_APPNAME="lvim" nvim'

#-----------#

alias hostinfo='hostname && ip addr show'
alias myip='curl -s https://checkip.amazonaws.com'

# alias hx='hexdump -C'
alias w1='watch -n 1'

#-----------#

alias dfm='pydf'
alias dum="ncdu --color off"

alias du1='du -h --max-depth=1'
alias usage='du -ch | grep total'
alias most='du -hax --max-depth=1 | sort -rh | head -10'
alias pusage='df -hlT --exclude-type=tmpfs --exclude-type=devtmpfs | less'
alias tusage='df -hl --total | grep total'

#-----------#

# alias backup='tar -zcvf $(date +%Y%m%d).tar.gz *'

bak() { mv "$1" "$1.bak"; }
ubak() { mv "${1}.bak" "$1"; }
# alias bak='xargs -I {} mv {} {}.bak'

#-----------#

alias update='sudo apt update && sudo apt -y upgrade'
alias fullup='sudo apt full-upgrade'
alias autorm='sudo apt -y autoremove && sudo apt autoclean'
alias fupdate='update && fullup && autorm'

alias show='apt show $1'
alias yupp='sudo apt install $1'
alias nope='sudo apt remove $1'

alias sctl='systemctl'

#--------------#

alias erc='nvim ~/.bashrc'
alias epro='nvim ~/.bash_profile'
alias ealias='nvim ~/.bash_aliases'
alias efunc='nvim ~/.bash_functions'
alias einput='nvim ~/.inputrc'
alias essh='nvim ~/.ssh/config'
alias evi='nvim ~/.vimrc'
alias etmux='nvim ~/.tmux.conf'
alias eipy='nvim ~/.ipython/profile_default/ipython_config.py'
alias egit='nvim ~/.gitconfig'

#-----------#

alias soinput="bind -f ~/.inputrc"
alias sopro="source ~/.bash_profile"
alias sorc="source ~/.bashrc"

#-----------#

alias jup='jupyter'
alias jupl='jupyter lab'
alias jupnb='jupyter notebook'

alias cve='uv venv'
alias cvet='uv venv --python $1'
alias act="source .venv/bin/activate"
alias dact='deactivate'
alias sopy='cve && act'

alias uvr='uv run'
alias uvrp='uv run python'
alias py='uv run $1'

alias uvi='uv init'
alias uvit='uv init --python $1'
alias uva='uv add'
alias uvad='uv add --dev'
alias uvrm='uv remove'
alias uvs='uv sync'
alias uvtr='uv tree'
alias uvup='uv lock --upgrade-package $1'
alias uvh='uv help'

alias uvt='uv tool'
alias uvtls='uv tool list'
alias uvti='uv tool install'
alias uvtU='uv tool uninstall'
alias uvtup='uv tool upgrade'

alias uvp='uv python'
alias pyi='uv python install'
alias pyll='uv python list'
alias pyls='uv python list --only-installed'
alias pyf='uv python find'
alias pyp='uv python pin'
alias pyU='uv python uninstall'

# alias rpy="uvicorn main:app --reload"

alias pipi="uv pip install"
alias pipU="uv pip uninstall"
alias pipls="uv pip list"
alias piptr="uv pip tree"
alias pipc='uv pip compile'
alias pipg="uv pip freeze | grep"
alias pipreq="uv pip freeze > requirements.txt"
alias pipir="uv pip install -r requirements.txt"
# uv pip check: Check that the current environment has compatible packages.
# uv pip tree: View the dependency tree for the environment.

alias ipython='ipython3'
alias ipy='ipython3'
alias ipyt='ipython3 --profile=tmp'
alias uvipy='uv run ipython3'

alias pyserver="uv run -m http.server"

alias pkgpath='python3 -c "import sys; pkg=sys.argv[1]; import importlib; mod=importlib.import_module(pkg); print(getattr(mod, \"__path__\", [None])[0]) if getattr(mod, \"__path__\", None) else print(\"No __path__ attribute\")"'

#-----------#

alias tm='tmux'
alias tmls='tmux ls'
alias tmnew='tmux new -s'
alias tma='tmux attach'
alias tmat='tmux attach -t'
alias tmkst='tmux kill-session -t'
alias tmks='tmux kill-server'

# alias atom='tmux new-session -A -s atomic'

#-----------#

alias bk="cd -"
alias ..="cd .."
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."

alias cdtmp='cd $(mktemp -d)'

alias mkcd='_mkcd() { mkdir -p "$1"; cd "$1"; }; _mkcd'
alias mk="mkdir -pv"

alias cdssh='cd ~/.ssh'
alias cdnvim='cd ~/.config/nvim'
alias cdipy='cd ~/.ipython/profile_default'
alias conf='cd ~/.config'
alias tmp='cd ~/tmp'
alias private='cd ~/private'
alias wre='cd ~/wre'
alias pre='cd ~/pre'
alias lre='cd ~/lre'
alias down='cd ~/down'
alias lab='cd ~/lab'
alias hlab='cd ~/hlab'
alias dotfiles='cd ~/lab/dotfiles'
alias dot='cd ~/dotfiles'
alias lea='cd ~/learn'

alias iam='cd /mnt/c/chintan357/vaults/atomic'
alias iamd='cd /mnt/c/chintan357/vaults/atomic/dailies'

alias todo='nvim /mnt/c/chintan357/vaults/atomic/inbox/todo.md'
alias pad='nvim /mnt/c/chintan357/vaults/atomic/inbox/pad.md'
alias ask='nvim /mnt/c/chintan357/vaults/atomic/inbox/ask.md'
alias dmp='nvim /mnt/c/chintan357/vaults/atomic/inbox/dump.md'

alias exp="Explorer.exe ."
alias mntc='cd /mnt/c'
alias mntcu='cd /mnt/c/Users'
alias vaultsw='cd /mnt/c/chintan357/vaults/'

alias cla='claude'

#-----------#

alias g=git
alias lg=lazygit

alias gatomic='gP && gaa && gcm -m atomic && gpu'

alias ginit='git init'
alias cg='cd `git rev-parse --show-toplevel`'

alias gaa='git add --all'
alias ga.='git add .'

# alias gd='git diff'
alias gdc='git diff --cached'

alias gbr='git branch'
alias gcl='git clone'
alias gcld='git clone --depth 1'

# alias gco='git checkout'
alias gcob='git checkout -b'
alias gbk='git checkout -'

alias gs='git status -sb'
alias gst='git status'

alias gcm='git commit'
alias gcmm='git commit -m'
alias gcmam='git commit -am'
alias gamend='git commit --amend --no-edit'

alias gpu='git push'
alias gP='git pull'
alias gpr='git pull --rebase'

alias gwc='git whatchanged'

alias glast="git log -1 HEAD"

alias hbr='gh browse'

# alias gnah="git clean -df && git checkout -- ."
# alias gclean='git clean -fd'
# alias gpristine='git reset --hard && git clean --force -dfx'
# alias groh='git reset origin/$(git_current_branch) --hard'
# alias gcan!='git commit --verbose --all --no-edit --amend'

#-----------#

alias lzd='lazydocker'
alias dk='docker'

alias dkps='docker ps'
alias dkpsa='docker ps -a'
alias dkx='docker exec -it'

alias dkbt='docker build -t'

alias dki='docker images'
# alias dkrmi='docker rmi'
# alias dkrmia='docker rmi $(docker images -q)'
 
# alias dkr='docker run'
# alias dkrd='docker run -d'
# alias dkrrm='docker run --rm'
 
# alias dkk='docker kill'
# alias dkka='docker kill $(docker ps -q)'
# alias dksa='docker stop $(docker ps -aq)'
 
# alias dkrm='docker rm'
# alias dkclean='docker system prune -af'
 
# alias dkl='docker logs'
# alias dklf='docker logs -f'

#-----------#

alias gaadl='gcloud auth application-default login'
alias gal='gcloud auth login'
alias gapat='gcloud auth print-access-token'
alias gcs='gcloud config set'
alias gcsp='gcloud config set project'
alias gconfls='gcloud config configurations list'
alias gconfa='gcloud config configurations activate'

#-----------#

alias t='sesh connect $(sesh list | fzf)'
alias R=ranger

alias deep='ssh deep'
alias dist='ssh dist'
alias smi='nvidia-smi'

alias gtypist='gtypist -c 0,2'

alias power='powershell.exe'

alias l='llm -m gemini-2.5-flash-lite-preview-06-17'
alias lchat='llm chat'
alias lchatf='llm chat -m gemini-2.5-flash'

alias dira='direnv allow'
alias chat='nvim -c ":CodeCompanionChat" -c ":only"'

#-----------#

source <(kubectl completion bash)
alias k='kubectl'
complete -F __start_kubectl k

alias ka='kubectl apply -f'
alias kdel='kubectl delete -f'
alias krf='kubectl replace --force -f'
alias kg='kubectl get'
alias kd='kubectl describe'
alias klo='kubectl logs'
alias klof='kubectl logs -f'
alias kexec='kubectl exec -it'
alias kctx='kubectl config use-context'
alias kns='kubectl config set-context --current --namespace'
alias kcc='kubectl config current-context'
alias kconf='kubectl config view'

alias kgp='kubectl get pods'
alias kgd='kubectl get deployments'
alias kgs='kubectl get svc'
alias kgn='kubectl get nodes'
alias kgi='kubectl get ingress'
alias kgr='kubectl get replicaset'
alias kgns='kubectl get namespaces'

# alias kdp='kubectl describe pod'
# alias kdd='kubectl describe deployment'
# alias kds='kubectl describe svc'
# alias kdn='kubectl describe node'

#-----------#

# alias rec='asciinema rec'
# alias play='asciinema play'

# alias ct='column -t'
# alias sniff='sudo tcpdump -i any -c 1000 -nn'
# alias rl="readlink -f"

# realpath "$*")" -iname "*"
# $(history -p !!)'
# 'sudo $(fc -ln -1)'

# alias make1='make -j$(($(nproc) + 1))'  # Use all cores +1 for compilation
# alias sha1='openssl sha1'

# alias secupdates='sudo unattended-upgrade -d'
# alias jou='sudo journalctl -b -n 200 -f'

# Run proper IPython regarding current virtualenv (if any)
# alias ipython='python3 -c "import IPython, sys; sys.exit(IPython.start_ipython())"'

# alias dkcls='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}"'
# alias dip="sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
# alias drmf='sudo docker stop $(sudo docker ps -a -q) && sudo docker rm $(sudo docker ps -a -q)'
# alias dkrrmit='docker run --rm -it'
# alias dkrrm8='docker run --rm -p 8080:8080'
# alias dkrrm9='docker run --rm -p 9090:9090'
# dock-run() { sudo docker run -i -t --privileged $@ ;}
# dock-exec() { sudo docker exec -i -t $@ /bin/bash ;}
# dock-log() { sudo docker logs --tail=all -f $@ ;}
# dock-port() { sudo docker port $@ ;}
# dock-vol() { sudo docker inspect --format '{{ .Volumes }}' $@ ;}
# dock-ip() { sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' $@ ;}
# dock-rmc() { sudo docker rm sudo docker ps -qa --filter 'status=exited' ;}
# dock-rmi() { sudo docker rmi -f sudo docker images | grep '^<none>' | awk '{print $3}' ;}
# dock-stop() { sudo docker stop $(docker ps -a -q); }
# dock-rm() { sudo docker rm $(docker ps -a -q); }
# dock-do() { if [ "$#" -ne 1 ]; then echo "Usage: $0 start|stop|pause|unpause|" fi

# for c in $(sudo docker ps -a | awk '{print $1}' | sed "1 d") do sudo docker $1 $c done }
# alias dkclean='docker ps -q -a -f status=exited | xargs -r docker rm && docker images -q -f dangling=true | xargs -r docker rmi'
