# alias kgp='kubectl get pods'
# alias kgd='kubectl get deployments'
# alias kgs='kubectl get svc'
# alias kgn='kubectl get nodes'
# alias kgi='kubectl get ingress'
# alias kgr='kubectl get replicaset'
# alias kgns='kubectl get namespaces'

# alias kdp='kubectl describe pod'
# alias kdd='kubectl describe deployment'
# alias kds='kubectl describe svc'
# alias kdn='kubectl describe node'

#-----------#


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

# alias CC='$(fc -ln -1) | cpy'
# alias path='cd "$(echo -e ${PATH//:/\\n} | fzf)"'
# alias genpwd='openssl rand -base64 16 | cpy'
# alias plz="fc -l -1 | cut -d' ' -f2- | xargs sudo"
#
# alias hx='hexdump -C'
# alias dfm='pydf'
# alias dum="ncdu --color off"
# alias backup='tar -zcvf $(date +%Y%m%d).tar.gz *'

# alias gnah="git clean -df && git checkout -- ."
# alias gclean='git clean -fd'
# alias gpristine='git reset --hard && git clean --force -dfx'
# alias groh='git reset origin/$(git_current_branch) --hard'
# alias gcan!='git commit --verbose --all --no-edit --amend'

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
# alias update='sudo apt update && sudo apt -y upgrade'
# alias bak='xargs -I {} mv {} {}.bak'
# alias jup='jupyter'
# alias jupl='jupyter lab'
# alias jupnb='jupyter notebook'
# alias fullup='sudo apt full-upgrade'
# alias fupdate='update && fullup && autorm'

alias kg='kubectl get'
alias kd='kubectl describe'
alias klo='kubectl logs'
alias klof='kubectl logs -f'
alias kexec='kubectl exec -it'
alias kctx='kubectl config use-context'
alias kconf='kubectl config view'

# alias gapat='gcloud auth print-access-token'
alias gcs='gcloud config set'
# alias gcsp='gcloud config set project'

alias dkx='docker exec -it'
