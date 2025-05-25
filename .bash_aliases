alias e=exit
alias c=clear
alias al=alias
alias ual=unalias

#-----------#

alias cpr='cp -r'
alias rmr='rm -r'
alias rmrf='rm -rf'

#-----------#

alias la='ls -A --group-directories-first'
alias ll='ls -Alh --group-directories-first | less -R'
alias lsd='ls -d */ 2> /dev/null'
alias lh='ls -d .[^.]* 2> /dev/null'
alias lt='tree -a -L 2 | less'

alias els='eza --group-directories-first'
alias el='eza -lh --git --color=always --icons=always --group-directories-first | less'
alias ela='eza -a --git --color=always --icons=always --group-directories-first'
alias ell='eza -Alh --git --color=always --group-directories-first | less'
alias elsd='eza -d */ 2> /dev/null'
alias elh='eza -a | egrep "^\."'
alias elt='eza -a --tree --level=2'

#-----------#

alias findf='find . -type f -name'
alias findd='find . -type d -name'

alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git}'

alias grepi='grep -i'
alias grepr='grep -r'
alias grepir='grep -ir'

alias pyfind='find . -name "*.py"'
alias pygrep='grep -nr --include="*.py"'

#-----------#

alias chownr='chown -R'
alias chmodr='chmod -R'
alias chmx='chmod u+x'

#-----------#

alias psx="ps auxf | less"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

alias disk='lsblk -f'
alias freeh='free -h'
alias mountc='mount | column -t | less'

alias lsock='sudo lsof -i -P'
alias ports='sudo netstat -tulanp'

alias p1='ping 1.1.1.1'
alias p8='ping 8.8.8.8'
alias clh8='curl localhost:8080'
clh() { curl localhost:$1; }

#-----------#

alias dfc='df -hPT | column -t'
alias osrel='cat /etc/os-release'
alias cpuinfo='cat /proc/cpuinfo | less'
alias meminfo='cat /proc/meminfo | less'
alias release='cat /etc/*-release'
alias unamea='uname -a'
alias unamer='uname -r'

#-----------#

alias rp='realpath'
alias cprp='sh -c '\''realpath "$1" | xclip -selection clipboard'\'' -'

alias cpy="xclip -selection clipboard"
alias CC='$(fc -l -n -1) | cpy'
alias cpwd='pwd|cpy'

alias path='echo -e ${PATH//:/\\n} | fzf' # TODO: bind cd

#-----------#

alias genpwd='openssl rand -base64 16 | cpy'
alias plz="fc -l -1 | cut -d' ' -f2- | xargs sudo"

#-----------#

alias fortune='/usr/games/fortune'
alias tux='cowsay -f tux '
alias matrix='cmatrix'

#-----------#

alias vim='nvim'
alias lvi='nvim -c "normal '\''0"'
alias v.='nvim .'

#-----------#

alias hostinfo='hostname && ip addr show'
alias myip='curl -s https://checkip.amazonaws.com'
alias localip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

alias tree3='tree -a -L 3 | less'

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

alias rmnvim='rm -rf ~/.config/nvim && rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim && rm -rf ~/.cache/nvim'
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

alias erc='$EDITOR ~/.bashrc'
alias epro='$EDITOR ~/.bash_profile'
alias ealias='$EDITOR ~/.bash_aliases'
alias efunc='$EDITOR ~/.bash_functions'
alias einput='$EDITOR ~/.inputrc'
alias essh='$EDITOR ~/.ssh/config'
alias evi='$EDITOR ~/.vimrc'
alias etmux='$EDITOR ~/.tmux.conf'
alias eipy='$EDITOR ~/.ipython/profile_default/ipython_config.py'
alias egit='$EDITOR ~/.gitconfig'

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

# py() { uv run $1; }
alias py='uv run $1'

alias uvi='uv init'
alias uvit='uv init --python $1'
alias uvr='uv run'
alias uvrp='uv run python'
alias uva='uv add'
alias uvrm='uv remove'
alias uvs='uv sync'
# uv add --script: Add a dependency to a script
# uv remove --script: Remove a dependency from a script

alias uvh='uv help'

alias uvt='uv tool'
# uv tree: View the dependency tree for the project.

alias uvup='uv lock --upgrade-package $1'

alias uvp='uv python'
alias pyp='uv python pin'
alias pyf='uv python find'
alias pyls='uv python list --only-installed'
alias pyll='uv python list'
alias pyi='uv python install'
alias pyU='uv python uninstall'

# alias rpy="uvicorn main:app --reload"

alias pip='uv pip'
alias pipi="pip install"
alias pipU="pip uninstall"
alias pipls="pip list"
alias pips="pip show"
alias pipg="pip freeze | grep"
alias pipreq="pip freeze > requirements.txt"
alias pipir="pip install -r requirements.txt"
# uv pip check: Check that the current environment has compatible packages.
# uv pip tree: View the dependency tree for the environment.

alias ipython='ipython3'
alias ipy='ipython3'
alias ipyt='ipython3 --profile=tmp'

alias pyserver="uv run -m http.server"

#-----------#

alias tm='tmux'
alias tmls='tmux ls'
alias tmnew='tmux new -s'
alias tma='tmux attach'
alias tmat='tmux attach -t'
alias tmkst='tmux kill-session -t'
alias tmks='tmux kill-server'

# alias tmlk='tmux list-keys'
alias atom='tmux new-session -A -s atomic'

#-----------#

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

alias cdssh='cd ~/.ssh'
alias cdnvim='cd ~/.config/nvim'
alias cdipy='cd ~/.ipython/profile_default'
alias config='cd ~/.config'
alias tmp='cd ~/tmp'
alias private='cd ~/private'
alias wre='cd ~/wre'
alias pre='cd ~/pre'
alias mre='cd ~/mreerepo/misc'
alias down='cd ~/down'
alias lab='cd ~/lab'
alias hlab='cd ~/homelab'
alias dotfiles='cd ~/lab/dotfiles'
alias dot='cd ~/dotfiles'
alias iam='cd /mnt/c/chintan357/vaults/atomic'

alias mntc='cd /mnt/c'
alias vaultsw='cd /mnt/c/chintan357/vaults/'

#-----------#

alias g=git
alias lg=lazygit

alias gatomic='gP && gaa && gcm -m atomic && gpu'

alias ginit='git init'
alias cg='cd `git rev-parse --show-toplevel`'

alias gaa='git add --all'
alias ga.='git add .'

alias gcl='git clone'

alias gco='git checkout'
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
alias glog='git log --oneline --decorate --all --graph'
alias glogp="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glogl='git log --stat'
alias gll='git log --stat'

alias grecent='git for-each-ref --sort="-committerdate" --format="%(committerdate:short) %(refname:short)" refs/heads'
alias glast="git log -1 HEAD"

alias hbr='gh browse'

#-----------#

alias lzd='lazydocker'
alias dk='docker'

alias dkps='docker ps'
alias dkpsa='docker ps -a'
alias dkx='docker exec -it'

alias dkbt='docker build -t'

alias dki='docker images'
alias dkrmi='docker rmi'
alias dkrmia='docker rmi $(docker images -q)'

alias dkr='docker run'
alias dkrd='docker run -d'
alias dkrrm='docker run --rm'

alias dkk='docker kill'
alias dkka='docker kill $(docker ps -q)'
alias dksa='docker stop $(docker ps -aq)'

alias dkrm='docker rm'
alias dkclean='docker system prune -af'

alias dkl='docker logs'
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

alias v='NVIM_APPNAME="tvim" nvim'
alias lvim='NVIM_APPNAME="lvim" nvim'
alias t='sesh connect $(sesh list | fzf)'
alias R=ranger

alias deep='ssh deep'
alias dist='ssh dist'
alias smi='nvidia-smi'

alias ytdl='youtube-dl'
alias gtypist='gtypist -c 0,2'

#-----------#

# alias rec='asciinema rec'
# alias play='asciinema play'
# alias ct='column -t'
# alias rmt=trash
# alias fw='sudo ufw'
# alias lh='ls -A | grep "^\."'
# alias ls='ls --group-directories-first --color=auto'
# alias search='function _search() { grep -r --exclude-dir={.git,.svn} $1 *; }; _search'
alias sniff='sudo tcpdump -i any -c 1000 -nn'
# alias rl="readlink -f"
# realpath "$*")" -iname "*"
# $(history -p !!)'
# 'sudo $(fc -ln -1)'
# alias make1='make -j$(($(nproc) + 1))'  # Use all cores +1 for compilation
# alias sha1='openssl sha1'
# alias tree='tree -a -I ".svn|.git|.hg|.idea" | less'
# alias du1="\du -d 1 -m"
# alias tree='tree -C --dirsfirst'
# alias to='function _to() { cd "$@" && tree; }; _to'
# alias secupdates='sudo unattended-upgrade -d'
# alias jou='sudo journalctl -b -n 200 -f'
# Run proper IPython regarding current virtualenv (if any)
# alias ipython='python3 -c "import IPython, sys; sys.exit(IPython.start_ipython())"'
# alias tmlkb='tmux list-keys | grep -v "unbind" | grep'  # List only bound keys
# alias tmlkB='tmux list-keys | grep "unbind" | grep'   # List only unbound keys
# alias twitter='xdg-open https://www.twitter.com'

# c() { cd ~/code/$1; }
# h() { cd ~/$1; }
# alias iam='cd ~/atomic'
# alias gnah="git clean -df && git checkout -- ."
# alias gclean='git clean -fd'
# alias gpristine='git reset --hard && git clean --force -dfx'
# alias groh='git reset origin/$(git_current_branch) --hard'
# alias gcan!='git commit --verbose --all --no-edit --amend'
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
