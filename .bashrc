export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_PORTAL_BACKEND=xdg-desktop-portal-wlr



# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set to superior editing mode
set -o vi

# ls
alias ls='ls --color=auto'
alias ll='ls -la'
# alias la='exa -laghm@ --all --icons --git --color=always'
alias la='ls -lathr'

# finds all files recursively and sorts by last modification, ignore hidden files
alias lastmod='find . -type f -not -path "*/\.*" -exec ls -lrt {} +'

alias sv='sudoedit'
alias t='tmux'
alias e='exit'
alias syu='sudo pacman -Syu'
alias key='ssh-add ~/.ssh/id_ed25519'
alias c='clear'
alias e='exit'

alias v=vim

#cd
alias ..='..'


# Repos
alias lab='cd ~/clones/lab'



# git
alias gp='git pull'
alias gs='git status'
alias lg='lazygit'

# Start SSH agent
eval "$(ssh-agent -s)"

# Kubectl
alias k='kubectl'
source <(kubectl completion bash)
source /etc/bash_completion

complete -o default -F __start_kubectl k

alias kgp='kubectl get pods'
alias kc='kubectx'
alias kn='kubens'

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/home/sschlangen/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
