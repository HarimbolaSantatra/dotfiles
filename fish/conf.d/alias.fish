# ls
alias l='ls'

# egrep alias
alias egrep='egrep --color=auto'

# Activate python environmenet
alias source_old_django_env='source ~/projet_kely/py-env/django_venv/bin/activate.fish'
alias source_rl_env='source ~/projet_kely/py-env/rl-env/bin/activate.fish'
alias source_django_env='source /home/santatra/projet_kely/py-env/django-4.2_venv/bin/activate.fish'
alias source_conda_env='source /home/santatra/anaconda3/bin/activate.fish'
alias source_misp_env='source /home/santatra/projet_kely/py-env/misp_env/bin/activate.fish'

# qmake pour c++. atao tsy qmake tsotra fa manjary mifangaro @ qmake ny anaconda
alias cpp_qmake='/opt/qtbase/bin/qmake'

# pour ping
alias ping8='ping 8.8.8.8'

# Pour tmux
## Attach ny default 0
alias t='tmux'
alias tmux0='tmux a -t 0'
alias tmuxa='tmux a -t '
alias tmuxls='tmux ls'
alias tmuxssh='tmux new -s ssh'
alias tmuxn='tmux new -s'

# tmux-resurect automatically
#alias tmuxr='tmux attach || { (while ! tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh; do sleep 0.2; done)&  tmux ; }'

# Telephone
alias open_phone='cd /run/user/1000/gvfs/'

# fzf
# sd: search directory
alias cdfzf="cd (find * -type d | fzf --height 40%)"
# open vim after fuzzy find file
alias vimfzf="vim (fzf --height=40%)"
# open nvim after fuzzy find file
alias nvimfzf="nvim (fzf --height=40%)"

# nvim --clean
alias nvimc="nvim --clean"

# Zoxide
alias "zqueryl"="zoxide query -l"

# xsel
# cd into directory from xsel clipboard
alias cdxsel="cd (xsel -b)"

# Tree: atao 2 level iany ny par default
alias tree="tree -L 2"

# Git
alias gadd="git add ."
alias gcommit="git commit -m"
alias gcommita="git commit -am"
alias gamend="git commit -a --amend --no-edit"
alias gstatus="git status"
alias glog="git log"
alias gbranch="git branch"
# for quitting rapidly
alias gall="git add . && git commit -m \"More\" && git push"

# Open fucking disk_d
alias diskd="open /media/santatra/disk_d"

# less with case insenstive
alias less="less -i"
alias dateless="date | less"

# feh: keep zoom and veiwport and fit to window
alias feh="feh --keep-zoom-vp --scale-down"

# network
alias show_port="sudo lsof -nP -iTCP -sTCP:LISTEN"

# vimconfig
alias vimconfig="cd -- ~/.config/nvim/ && vim -p init.lua ~/.vimrc ~/.config/nvim/lua/santatra/remap.lua"
alias shellconfig="cd -- ~/.config/fish/ && vim -p config.fish conf.d/alias.fish ~/.bash_aliases ~/.bashrc"

alias br="sudo brightnessctl set "

# Docker
alias compose="docker compose"

# Edition
alias edit_nginx="sudo vim /etc/nginx/sites-available/default"

# EQIMA: ping
alias ping_wazuh="ping 185.246.86.172"
alias ping_hive="ping 185.246.87.101"
alias ping_misp="ping 185.246.86.154"
alias ping_master="ping 185.246.86.10"
alias ping_slave="ping 185.246.84.145"
alias ping_002="ping 185.246.84.173"

# Password
alias secpass="apg -n 6 -m 20 -M SNCL"

# Kubernetes
alias kubelog="kubectl logs"
alias kubeget="kubectl get"

# lxc/lxd
alias lxc='sudo lxc'
alias lxd='sudo lxd'
