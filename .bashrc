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
alias notes="cd ~/2nd-brain"
alias v=vim
alias inbox="cd /home/sschlangen/2nd-brain/0-Inbox"
alias day='cd "/home/sschlangen/2nd-brain/Periodic Notes/Daily"'
alias week='cd "/home/sschlangen/2nd-brain/Periodic Notes/Weekly"'
alias month='cd "/home/sschlangen/2nd-brain/Periodic Notes/Monthly"'
alias ..="cd .."
alias cv="v /home/sschlangen/clones/ssmedia.tv/content/cv.md"
alias blog="v /home/sschlangen/clones/ssmedia.tv/content/about.md"
alias tools="v /home/sschlangen/clones/ssmedia.tv/content/tools.md"


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

complete -o default -F __start_kubectl k

alias kgp='kubectl get pods'
alias kc='kubectx'
alias kn='kubens'

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/home/sschlangen/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
