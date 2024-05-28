alias cls='clear;ls'

alias ls="eza --icons=always --group-directories-first"
alias la='eza -a --color=always --icons=always --group-directories-first'
alias l='eza -lhF --git --group-directories-first --color=always'
alias ll='eza -Alah --git --color=always --group-directories-first'
alias lh='eza -a | egrep "^\."'
alias lsd='eza -d */ 2> /dev/null'
alias lt='eza --tree --level=2'

alias findf='find . -type f -name'
alias findd='find . -type d -name'
alias count='find . -type f | wc -l'

alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias chownr='sudo chown -R --preserve-root'
alias chmodr='sudo chmod -R --preserve-root'

alias memtop10='ps aux --sort=-%mem | head -11'
alias cputop10='ps aux --sort=-%cpu | head -11'
alias psx="ps auxf"

alias disk='lsblk -f'
alias mounts='mount | column -t'
alias free='free -mh'

alias hostinfo='hostname && ip addr show'

alias sniff='sudo tcpdump -i any -c 1000 -nn'
alias lsock='sudo lsof -i -P'
alias ports='sudo netstat -tulanp'
alias nmap='nmap -v'
alias ping='ping -c 5'

# alias secupdates='sudo unattended-upgrade -d'

#-----------#

alias rp='realpath'
alias cpy="xclip -selection clipboard"
alias fpath="readlink -f"
function realfzf() { find "$(ralias rp='realpath'ealpath "$*")" -iname "*" | fzf; }

#-----------#

alias plz="fc -l -1 | cut -d' ' -f2- | xargs sudo"
# alias please='sudo $(history -p !!)'  # Run last command as sudo
# alias please='sudo $(fc -ln -1)'  # Re-run last command with sudo

# weather() { curl wttr.in/"$1"; }
# alias weather='curl wttr.in'
dict() { curl "dict.org/d:$1"; }
alias fortune='/usr/games/fortune'
alias tuxsay='cowsay -f tux '
alias matrix='cmatrix'

alias vi="$EDITOR"
alias vim="$EDITOR"
alias lvi='$EDITOR -c "normal '\''0"'
alias v.='$EDITOR .'

alias e=exit
alias c=clear

alias tailf='tail -f'
alias path='echo -e ${PATH//:/\\n} | fzf'

# alias make1='make -j$(($(nproc) + 1))'  # Use all cores +1 for compilation
alias hg='history | grep'
alias sha1='openssl sha1'

alias whoami='who am i'

alias myip='curl http://ipecho.net/plain; echo'
alias localip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias flushdns='sudo systemd-resolve --flush-caches'

alias CC='$(fc -l -n -1) | cpy'

alias cp='cp -r'
# alias rm='rm -r'
alias rr='rm -rf'

alias chmx='chmod +x'

alias tree='tree -a -I ".svn|.git|.hg|.idea"'

# alias hx='hexdump -C'
# alias w1='watch -n 1'

alias usage='du -ch | grep total'
alias totalusage='df -hl --total | grep total'
alias partusage='df -hlT --exclude-type=tmpfs --exclude-type=devtmpfs'
alias most='du -hsx * | sort -rh | head -10'
# alias du1="du -d 1"

alias rmnvim='rm -rf ~/.config/nvim && rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim && rm -rf ~/.cache/nvim'
alias gaadl='gcloud auth application-default login'

# alias cp='rsync -ah — info=progress2'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias ps="ps auxf"


alias py='function _py() { python3 $1; }; _py'
alias backup='tar -zcvf $(date +%Y%m%d).tar.gz *'
# alias tree='tree -C --dirsfirst'
# alias to='function _to() { cd "$@" && tree; }; _to'
alias search='function _search() { grep -r --exclude-dir={.git,.svn} $1 *; }; _search'
alias genpwd='openssl rand -base64 16 | cpy'
alias cpwd='pwd|cpy'

alias top=htop
alias rm=trash
alias cat=batcat
alias rd=rmdir
alias bc="bc -l"
alias dfm=pydf
alias dum=ncdu
alias cal='ncal -y -M'
alias fw='sudo ufw'

alias wget='wget -c'
alias diff='diff --color'
alias whois='whois -H'

alias update='sudo apt update && sudo apt upgrade'
alias update-get='sudo apt-get update && sudo apt-get upgrade'
alias distup='sudo apt-get dist-upgrade'
alias fupdate='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade'
alias clean-get='sudo apt-get autoremove && sudo apt-get autoclean'
alias clean='sudo apt autoremove && sudo apt autoclean'
alias updateandclean='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt autoclean && sudo apt autoremove'
alias yupp='sudo apt install $1'
alias show='sudo apt show $1'
alias nope='sudo apt remove $1'

alias sctl='systemctl'
alias jou='sudo journalctl -b -n 200 -f'

alias grepr='grep -r'
alias grepi='grep -i'
alias grepri='grep -ri'

alias tree1='tree -L 1'
alias tree2='tree -L 2'
alias tree3='tree -L 3'

alias hist="history"
alias h1="history 10"
alias h2="history 20"
alias h3="history 30"

alias p1='ping 1.1.1.1'
alias p8='ping 8.8.8.8'
alias p9='ping 9.9.9.9'
alias clh3='curl localhost:3000'
alias clh8='curl localhost:8080'
alias clh5='curl localhost:5050'

alias k9='kill -9'
alias k15='kill -15'

alias erc="$EDITOR ~/.bashrc"
alias epro="$EDITOR ~/.bash_profile"
alias ealias="$EDITOR ~/.bash_aliases"
alias essh='$EDITOR ~/.ssh/config'
alias evim="$EDITOR ~/.vimrc"
alias envim="$EDITOR ~/.config/nvim/init.lua"
alias etmux="$EDITOR ~/.tmux.conf"
alias eprompt="$EDITOR ~/.config/starship.toml"
alias sopro="source ~/.bash_profile && echo 'refreshed bash_profile...'"
alias sorc="source ~/.bashrc && echo 'refreshed bashrc...'"

#-----------#
alias jupnb='jupyter notebook'

alias cve='python3 -m venv .venv'
alias act="source .venv/bin/activate"
alias dact='deactivate'
alias sopy='cve && act'
alias rpy="uvicorn main:app --reload"

# pyenv
alias pyv='pyenv versions'
alias pyls='pyenv install --list'
alias pyi='pyenv install'
alias pyu='pyenv update'
alias pyg='pyenv global'
alias pyl='pyenv local'
alias pyU='pyenv uninstall'
alias pyve='pyenv virtualenv'
alias pyvels='pyenv virtualenvs'
alias pya='pyenv activate'
alias pyd='pyenv deactivate'

alias pxi='pipx install'

alias pipi="pip install"
alias pipup="pip install --upgrade"
alias pipun="pip uninstall"
alias pipg="pip freeze | grep"
alias piplo="pip list -o"
alias pipreq="pip freeze > requirements.txt"
alias pipir="pip install -r requirements.txt"

alias pygrep='grep -nr --include="*.py"'
# alias ipython='python3 -c "import IPython, sys; sys.exit(IPython.start_ipython())"'
alias pyserver="python3 -m http.server"

#-----------#

alias tm='tmux'
alias tmls='tmux ls'
alias tmnew='tmux new -s'
alias tma='tmux attach'
alias tmat='tmux attach -t'
alias tmkst='tmux kill-session -t'
alias tmks='tmux kill-server'

alias tmlk='tmux list-keys'               # List bound keys in tmux
# alias tmlkb='tmux list-keys | grep -v "unbind" | grep'  # List only bound keys
# alias tmlkB='tmux list-keys | grep "unbind" | grep'   # List only unbound keys

#-----------#


alias cd..='cd ..'
alias cdtmp='cd $(mktemp -d)'
alias root='cd /'

alias R=". ranger"
alias exp="Explorer.exe ."

alias bk="cd -"
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."

alias mkcd='_mkcd() { mkdir -p "$1"; cd "$1"; }; _mkcd'
alias md="mkdir -pv"

function cdl() {
  cd "$1" && ls
}

# alias docs='xdg-open ~/Documents'
# alias twitter='xdg-open https://www.twitter.com'


alias vaults='cd $HOME/vaults'
# c() { cd ~/code/$1; }
# h() { cd ~/$1; }
alias desk="cd /mnt/c/Users/ChintanPatel/Desktop"
alias cdnvim='cd ~/.config/nvim'
alias obsd='cd /mnt/c/saleenaa357/daily_notes'
alias config='cd ~/.config'
alias tmp='cd ~/trash'
alias repo='cd ~/repo'
alias work='cd ~/work'
alias lab='cd ~/homelab'
alias idya='cd ~/idya'
alias dotfiles='cd ~/lab/dotfiles'
alias dot='cd ~/dotfiles'
alias private='cd ~/private'
alias downloads='cd ~/downloads'
#-----------#

alias ytdl='youtube-dl'

#-----------#

alias dk='docker'

alias dkps='docker ps'
alias dkpsa='docker ps -a'

alias dkk='docker kill'
alias dkka='docker kill $(docker ps -q)'
alias dksa='docker stop $(docker ps -aq)'

alias dkrmi='docker rmi'
alias dkrmia='docker rmi $(docker images -q)'

alias dkclean='docker system prune -af'

alias dkx='docker exec -it'
alias dkl='docker logs -f'
alias dkc='docker-compose'
alias dkpsaq='docker ps -a -q'
alias dkb='docker build -t'
alias dkrm='docker rm'
alias dkrd='docker run -d'
alias dkrrm='docker run --rm'
alias dkrrmit='docker run --rm -ti'
alias dkrrm8='docker run --rm -p 8080:8080'
alias dkrrm9='docker run --rm -p 9080:9080'

alias dklf='docker logs -f'
alias dki='docker images'

alias dkcls='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}"'
alias dip="sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias drmf='sudo docker stop $(sudo docker ps -a -q) && sudo docker rm $(sudo docker ps -a -q)'

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
#
# for c in $(sudo docker ps -a | awk '{print $1}' | sed "1 d") do sudo docker $1 $c done }

# alias dkclean='docker ps -q -a -f status=exited | xargs -r docker rm && docker images -q -f dangling=true | xargs -r docker rmi'
#-----------#

alias lg=lazygit

alias g=git
alias ga='git add'
alias gaa='git add .'
alias gcl='git clone'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gb="git branch"
alias gbl="git branch -l"

alias gd='git diff'
alias gds="git diff --staged"

alias gst='git status'
alias gsts='git status -sb'

alias glog='git log --oneline --decorate --all --graph'

alias gc="git commit"
alias gcm='git commit -m'
alias gcam="git commit -am"
alias amend='git commit --amend --no-edit'
alias gcaa="git commit -a --amend"

alias gp='git push'
alias gP='git pull'
alias gpo='git push origin'

alias go="git push -u origin"
alias gwc='git whatchanged'
alias glogp="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gnah="git clean -df && git checkout -- ."

alias grv="git remote -v"
alias gbD='git branch -D'
alias grecent='git for-each-ref --sort="-committerdate" --format="%(committerdate:short) %(refname:short)" refs/heads'
alias glast="git log -1 HEAD"
alias gbd='git branch -d'    # Delete a branch
alias gcb='git checkout -b'  # Create and checkout a new branch
alias gll='git log --stat'
alias grb='git rebase'
alias grbi='git rebase -i'
alias grm='git remote'
alias grmv='git remote -v'
alias grma='git remote add'
alias grmr='git remote remove'
alias grmu='git remote update'
alias gtag='git tag'
alias gtagd='git tag -d'
alias gtags='git tag -l'
alias gclean='git clean -fd'
alias gcp='git cherry-pick'
alias gf='git fetch'
alias gfa='git fetch --all'
alias grs='git reset'
alias grsh='git reset --hard'
alias grss='git reset --soft'

alias hcl="hub clone"
alias hbr='hub browse'
alias hrepo='hub repo'
alias hfork='hub fork'
alias hcreate='hub create'
alias hprls='hub pr list'
alias hprshow='hub pr show'
# alias hpr='hub pull-request'
# alias hco='hub checkout'
# alias hci='hub ci-status'
# alias hsync='hub sync'
# alias his='hub issue'
# alias hnewissue='hub issue create'
# alias hprmerge='hub pr merge'
# alias hprco='hub pr checkout'

#-----------#

alias kc='kubectl'
alias kcg='kubectl get'
alias kcgn='kubectl get --namespace'
alias kcd='kubectl describe'
alias kcdn='kubectl describe --namespace'
alias kcdl='kubectl delete'
alias kcdln='kubectl delete --namespace'
alias kcdlp='kubectl-delete-pod'
alias kcgno='kubectl get nodes'
alias kcgp='kubectl get pods'
alias wkcgp='w1 kubectl get pods'
alias kcgpn='kubectl get pods --namespace'
alias kcgd='kubectl get deployments'
alias kcgdn='kubectl get deployments --namespace'
alias kcgs='kubectl get services'
alias kcgsn='kubectl get services --namespace'
alias kcgi='kubectl get ingresses'
alias kcgin='kubectl get ingresses --namespace'
alias kcgc='kubectl get configmaps'
alias kcgv='kubectl get virtualservices'
alias kcgvn='kubectl get virtualservices --namespace'
alias kcgpp='kubectl get pods --all-namespaces'
alias kcgdd='kubectl get deployments --all-namespaces'
alias kcgss='kubectl get services --all-namespaces'
alias kcgii='kubectl get ingresses --all-namespaces'
alias kcgcn='kubectl get configmaps --namespace'
alias kcgcc='kubectl get configmaps --all-namespaces'
alias kcgvv='kubectl get virtualservices --all-namespaces'
alias kcgdr='kubectl get destinationrules'
alias kcgdrn='kubectl get destinationrules --namespace'
alias kcgdrr='kubectl get destinationrules --all-namespaces'
alias kcgg='kubectl get gateways'
alias kcggn='kubectl get gateways --namespace'
alias kcggg='kubectl get gateways --all-namespaces'
alias kcgse='kubectl get serviceentries'
alias kcgsen='kubectl get serviceentries --namespace'
alias kcgsee='kubectl get serviceentries --all-namespaces'
alias kcgr='kubectl get routerules'
alias kcgrn='kubectl get routerules --namespace'
alias kcgrr='kubectl get routerules --all-namespaces'
alias kcgdp='kubectl get destinationpolicies'
alias kcgdpn='kubectl get destinationpolicies --namespace'
alias kcgdpp='kubectl get destinationpolicies --all-namespaces'
alias kcge='kubectl get events --sort-by=".lastTimestamp" --all-namespaces --watch'
alias kcc='kubectl create'
alias kccn='kubectl create --namespace'
alias kca='kubectl apply -f'
alias kcan='kubectl apply -f --namespace'
alias kce='kubectl exec -t -i'
alias kcen='kubectl exec -t -i --namespace'
alias kcl='kubectl logs -f'
alias kcll='kubectl-logs'
alias kcln='kubectl logs -f --namespace'
alias kcgx='kubectl config get-contexts'
alias kcux='kubectl config use-context'
alias kcxsn='kubectl config set-context $(kubectl config current-context) --namespace'
alias kcpf='kubectl port-forward'
alias kcpfn='kubectl port-forward --namespace'
alias kcpfg='kubectl-port-forward-grafana'
alias kcpfj='kubectl-port-forward-jaeger'
alias kcpfk='kubectl-port-forward-kiali'
alias kcpfp='kubectl-port-forward-prometheus'
alias kcpfpf='kubectl-port-forward-prometheus-federation'
alias kcpfz='kubectl-port-forward-zipkin'
alias kcdldr='kubectl-delete-default-resources'
alias kcii='kubectl-ingress-ip-address'
alias kcni='kubectl-nginx-ip-address'
alias kcigip='kubectl-istio-gateway-ip-address'
alias kcignp='kubectl-istio-gateway-http-nodeport'

# minikube
alias mks='minikube start'
alias mkt='minikube stop'

#-----------#

if [ -f ~/.config/action/sources ]; then
	. ~/.config/action/sources
fi

#-----------#
