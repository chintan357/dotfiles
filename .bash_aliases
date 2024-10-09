#-----------#

alias e=exit
alias c=clear
alias al='alias'
alias cls='clear;ls'
alias ct='column -t'

#-----------#

alias top=htop
alias rm=trash
alias cat=batcat
alias cal='ncal -y -M'
alias fw='sudo ufw'

#-----------#

alias bc="bc -l"
alias wget='wget -c'
alias whois='whois -H'
alias cp='cp -r'
alias diff='diff --color'

alias rmf='rm -rf'
alias sortnr='sort -n -r'
alias tailf='tail -f'

alias hist="history"
alias h1="history 10"
alias h2="history 20"
alias h3="history 30"

alias hg='history | grep'

#-----------#

alias ls='eza --group-directories-first'
alias l='eza -lh --git --color=always --icons=always --group-directories-first'
alias la='eza -a --git --color=always --icons=always --group-directories-first'
alias ll='eza -Alah --git --color=always --group-directories-first | less'

alias lsd='eza -d */ 2> /dev/null'
alias lh='eza -a | egrep "^\."'
alias lt='eza -a --tree --level=2 | less'

#-----------#

alias findf='find . -type f -name'
alias findd='find . -type d -name'
# alias search='function _search() { grep -r --exclude-dir={.git,.svn} $1 *; }; _search'

alias count='find . -type f | wc -l'

alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS}'

alias grepr='grep -r'
alias grepi='grep -i'
alias grepri='grep -ri'

alias pyfind='find . -name "*.py"'
alias pygrep='grep -nr --include="*.py"'

#-----------#

alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias chownr='sudo chown -R --preserve-root'
alias chmodr='sudo chmod -R --preserve-root'
alias chmx='chmod +x'

#-----------#

alias ps='\ps -f'
alias psx="\ps auxf"
alias psg="\ps aux | grep -v grep | grep -i -e VSZ -e"

alias k9='kill -9'
alias k15='kill -15'

alias memtop='\ps aux --sort=-%mem | head -11'
alias cputop='\ps aux --sort=-%cpu | head -11'

alias disk='lsblk -f'
alias free='free -mh'
alias mount='mount | column -t'

alias ping='ping -c 5'
alias sniff='sudo tcpdump -i any -c 1000 -nn'
alias lsock='sudo lsof -i -P'
alias ports='sudo netstat -tulanp'
alias nmap='nmap -v'

alias p1='ping 1.1.1.1'
alias p8='ping 8.8.8.8'
alias p9='ping 9.9.9.9'
alias clh3='curl localhost:3000'
alias clh8='curl localhost:8080'
alias clh5='curl localhost:5050'

#-----------#

alias dfc='df -hPT | column -t'
alias osrelease='cat /etc/os-release'
alias cpuinfo='cat /proc/cpuinfo'
alias meminfo='cat /proc/meminfo'
alias release='cat /etc/*-release'
alias unamea='uname -a'
alias unamer='uname -r'

#-----------#

alias rp='realpath'
alias cprp='sh -c '\''realpath "$1" | xclip -selection clipboard'\'' -'

alias cpy="xclip -selection clipboard"
alias CC='$(fc -l -n -1) | cpy'
alias cpwd='pwd|cpy'

alias rl="readlink -f"

# realpath "$*")" -iname "*"
alias path='echo -e ${PATH//:/\\n} | fzf'

#-----------#

alias genpwd='openssl rand -base64 16 | cpy'
alias plz="fc -l -1 | cut -d' ' -f2- | xargs sudo"

# $(history -p !!)'
# 'sudo $(fc -ln -1)'

#-----------#

alias fortune='/usr/games/fortune'
alias tuxsay='cowsay -f tux '
alias matrix='cmatrix'

#-----------#

alias vim="$EDITOR"
alias lvi='$EDITOR -c "normal '\''0"'
alias v.="$EDITOR ."

#-----------#

# alias make1='make -j$(($(nproc) + 1))'  # Use all cores +1 for compilation
alias sha1='openssl sha1'

alias hostinfo='hostname && ip addr show'
alias whoami='who am i'

alias myip='curl -s https://checkip.amazonaws.com'

alias localip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias flushdns='sudo systemd-resolve --flush-caches'

alias tree='tree -a -I ".svn|.git|.hg|.idea" | less'

alias hx='hexdump -C'
alias w1='watch -n 1'

#-----------#

alias df='\df -h'
alias du='\du -hs'
alias dfm='pydf'
alias dum="ncdu --color off"

alias usage='\du -ch | grep total'
alias totalusage='\df -hl --total | grep total'
alias partusage='\df -hlT --exclude-type=tmpfs --exclude-type=devtmpfs'

alias most='\du -hsx * | sort -rh | head -10'
alias bigfiles='\du -ha . | sort -rh | head -20'
alias dirsize="\du -sch ./* 2> /dev/null"

alias du1='\du -h --max-depth=1'
# alias du1="\du -d 1 -m"

#-----------#

alias rmnvim='rm -rf ~/.config/nvim && rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim && rm -rf ~/.cache/nvim'
alias py='function _py() { python3 $1; }; _py'
alias backup='tar -zcvf $(date +%Y%m%d).tar.gz *'
# alias tree='tree -C --dirsfirst'
# alias to='function _to() { cd "$@" && tree; }; _to'

#-----------#

# alias secupdates='sudo unattended-upgrade -d'
alias update='sudo apt update && sudo apt upgrade'
alias update-get='sudo apt-get update && sudo apt-get upgrade'

alias autoremove='sudo apt autoremove && sudo apt autoclean'
alias autoremove-get='sudo apt-get autoremove && sudo apt-get autoclean'

alias distup='sudo apt-get dist-upgrade'
alias fupdate='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade'
alias updatenclean='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt autoclean && sudo apt autoremove'

alias show='apt show $1'
alias yupp='sudo apt install $1'
alias nope='sudo apt remove $1'

alias sysctl='systemctl'
alias jou='sudo journalctl -b -n 200 -f'

alias tree2='\tree -L 2 | less'
alias tree3='\tree -L 3 | less'

#--------------#

alias erc="$EDITOR ~/.bashrc"
alias epro="$EDITOR ~/.bash_profile"
alias ealias="$EDITOR ~/.bash_aliases"
alias einput="$EDITOR ~/.inputrc"
alias essh="$EDITOR ~/.ssh/config"
alias etmux="$EDITOR ~/.tmux.conf"
alias eprompt="$EDITOR ~/.config/starship.toml"
alias eipy="$EDITOR ~/.ipython/profile_default/ipython_config.py"
alias ei3="$EDITOR ~/.config/i3/config"

#-----------#

alias soinput="source ~/.inputrc && echo 'refreshed .inputrc'"
alias sopro="source ~/.bash_profile && echo 'refreshed .bash_profile'"
alias sorc="source ~/.bashrc && echo 'refreshed .bashrc'"

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
alias pyU='pyenv uninstall'
alias pyg='pyenv global'
alias pyl='pyenv local'
alias pyve='pyenv virtualenv'
alias pyvels='pyenv virtualenvs'
alias pyact='pyenv activate'
alias pydact='pyenv deactivate'

alias pxi='pipx install'

alias pipi="pip install"
alias pipup="pip install --upgrade"
alias pipun="pip uninstall"
alias pipU="pip uninstall"
alias pipg="pip freeze | grep"
alias piplo="pip list -o"
alias pipreq="pip freeze > requirements.txt"
alias pipir="pip install -r requirements.txt"

# Run proper IPython regarding current virtualenv (if any)
# alias ipython='python3 -c "import IPython, sys; sys.exit(IPython.start_ipython())"'
alias ipython='ipython3'
alias ipy='ipython3'

alias pyserver="python3 -m http.server"

#-----------#

alias tm='tmux'
alias tmls='tmux ls'
alias tmnew='tmux new -s'
alias tma='tmux attach'
alias tmat='tmux attach -t'
alias tmkst='tmux kill-session -t'
alias tmks='tmux kill-server'

alias tmlk='tmux list-keys'
alias atomic='tmux new-session -A -s atomic'
# alias tmlkb='tmux list-keys | grep -v "unbind" | grep'  # List only bound keys
# alias tmlkB='tmux list-keys | grep "unbind" | grep'   # List only unbound keys

#-----------#

alias R="yy"
alias exp="Explorer.exe ."

alias bk="cd -"
alias root='cd /'
alias cd..='cd ..'
alias ..="cd .."
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."

alias cdtmp='cd $(mktemp -d)'

alias mkcd='_mkcd() { mkdir -p "$1"; cd "$1"; }; _mkcd'
alias mk="mkdir -pv"

# alias twitter='xdg-open https://www.twitter.com'

# c() { cd ~/code/$1; }
# h() { cd ~/$1; }

alias deskw="cd /mnt/c/Users/ChintanPatel/Desktop"
alias vaultsw="cd /mnt/c/chintan357/vaults/"
alias obsd='cd /mnt/c/saleenaa357/daily_notes'

alias cdssh='cd ~/.ssh'
alias cdnvim='cd ~/.config/nvim'

alias vaults='cd ~/vaults'
alias obs='cd ~/Videos/obs'
alias config='cd ~/.config'
alias tmp='cd ~/tmp'
alias repo='cd ~/repo'
alias work='cd ~/work'
alias lab='cd ~/lab'
alias hlab='cd ~/homelab'
alias idya='cd ~/idya'
alias idea="eureka"
alias dotfiles='cd ~/lab/dotfiles'
alias dot='cd ~/dotfiles'
alias private='cd ~/private'

alias desk="cd ~/Desktop"
alias docs="cd ~/Documents"
alias down='cd ~/Downloads'

#-----------#

alias ytdl='youtube-dl'

#-----------#

alias g=git
alias lg=lazygit
alias lzg=lazygit

alias cg='cd `git rev-parse --show-toplevel`'
alias gatomic='gP && gaa && gcm atomic && gpu'

alias gaa='git add --all'
alias ga.='git add .'

alias gcl='git clone'

alias gco='git checkout'
alias gcob='git checkout -b'

alias gbr='git branch'
alias gbrl='git branch -l --sort=committerdate'

alias gdiff='git diff'
alias gdiffs="git diff --staged"

alias gst='git status'
alias gsts='git status -sb'

alias gcm='git commit -m'
alias amend='git commit --amend --no-edit'

alias gpu='git push'
alias gpush='git push'
alias gpuo='git push origin'
alias gP='git pull'
alias gpull='git pull'

alias gwc='git whatchanged'
alias glog='git log --oneline --decorate --all --graph'
alias glogp="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glogl='git log --stat'
alias gll='git log --stat'

alias grecent='git for-each-ref --sort="-committerdate" --format="%(committerdate:short) %(refname:short)" refs/heads'
alias glast="git log -1 HEAD"

alias grb='git rebase'
alias grbi='git rebase -i'

alias gre='git remote -v'
alias grea='git remote add'
alias grerm='git remote remove'

alias gtag='git tag'

alias gcp='git cherry-pick'

alias gnah="git clean -df && git checkout -- ."
alias gclean='git clean -fd'

alias grs='git reset'
alias grsh='git reset --hard'
alias grss='git reset --soft'

alias grsst='git restore --staged'
# alias gpristine='git reset --hard && git clean --force -dfx'
# alias groh='git reset origin/$(git_current_branch) --hard'
# alias gcan!='git commit --verbose --all --no-edit --amend'

alias hcl="hub clone"
alias hbr='hub browse'
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

# alias lzd='lazydocker'
# alias dk='docker'
#
# alias dkps='docker ps'
# alias dkpsa='docker ps -a'
#
# alias dkk='docker kill'
# alias dkka='docker kill $(docker ps -q)'
# alias dksa='docker stop $(docker ps -aq)'
#
# alias dkrmi='docker rmi'
# alias dkrmia='docker rmi $(docker images -q)'
#
# alias dkclean='docker system prune -af'
#
# alias dkx='docker exec -it'
# alias dkl='docker logs -f'
# alias dkc='docker-compose'
# alias dkpsaq='docker ps -a -q'
# alias dkb='docker build -t'
# alias dkrm='docker rm'
# alias dkrd='docker run -d'
# alias dkrrm='docker run --rm'
# alias dkrrmit='docker run --rm -ti'
# alias dkrrm8='docker run --rm -p 8080:8080'
# alias dkrrm9='docker run --rm -p 9080:9080'
#
# alias dklf='docker logs -f'
# alias dki='docker images'
#
# alias dkcls='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}"'
# alias dip="sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
# alias drmf='sudo docker stop $(sudo docker ps -a -q) && sudo docker rm $(sudo docker ps -a -q)'

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


# alias kc='kubectl'
#
# alias kcg='kubectl get'
# alias kcgn='kubectl get --namespace'
#
# alias kcd='kubectl describe'
# alias kcdn='kubectl describe --namespace'
#
# alias kcdl='kubectl delete'
# alias kcdln='kubectl delete --namespace'
# alias kcdlp='kubectl-delete-pod'
#
# alias wkcg='w1 kubectl get'
# alias kcg='kubectl get'
# alias kcgn='kubectl get --namespace'
# alias kcgan='kubectl get pods --all-namespaces'
#
# alias kcge='kubectl get events --sort-by=".lastTimestamp" --all-namespaces --watch'
# alias kcr='kubectl create'
# alias kca='kubectl apply -f'
# alias kce='kubectl exec -t -i'
# alias kclf='kubectl logs -f'
# alias kccon='kubectl config'
# alias kcxsn='kubectl config set-context $(kubectl config current-context) --namespace'
# alias kcpf='kubectl port-forward'
# alias kcdldr='kubectl-delete-default-resources'
# alias kcii='kubectl-ingress-ip-address'
# alias kcni='kubectl-nginx-ip-address'
# alias kcigip='kubectl-istio-gateway-ip-address'
# alias kcignp='kubectl-istio-gateway-http-nodeport'

# minikube
# alias mks='minikube start'
# alias mkt='minikube stop'

#-----------#

alias gtypist='gtypist -c 0,2'

#-----------#

alias gaadl='gcloud auth application-default login'
alias gauth='gcloud auth login'
alias gapat='gcloud auth print-access-token'
alias gprols='gcloud projects list'
alias gsetpro='gcloud config set project'
alias gconfls='gcloud config configurations list'
alias gconfa='gcloud config configurations activate'
