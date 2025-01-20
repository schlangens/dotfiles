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
alias inbox="v /home/sschlangen/2nd-brain/0-Inbox"
alias day='v "/home/sschlangen/2nd-brain/Periodic Notes/Daily"'
alias week='v "/home/sschlangen/2nd-brain/Periodic Notes/Weekly"'
alias month='v "/home/sschlangen/2nd-brain/Periodic Notes/Monthly"'
alias ..="cd .."
alias cv="v /home/sschlangen/clones/scottschlangen.com/content/cv.md"
alias blog="v /home/sschlangen/clones/scottschlangen.com/content/about.md"
alias tools="v /home/sschlangen/clones/scottschlangen.com/content/tools.md"


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


# Function to parse git brance
parse_git_branch() {
    local branch=""
    local status=""
    
    # Get the current branch name
    branch=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
    if [ -n "$branch" ]; then
        # Get detailed status
        status=$(git status -sb 2>/dev/null | head -1 | sed -e 's/## //')

        # Parse the status to indicate behind/ahead/changes
        if [[ $status == *ahead* ]]; then
            branch="$branch↑"  # Indicate ahead
        fi
        if [[ $status == *behind* ]]; then
            branch="$branch↓"  # Indicate behind
        fi
        if [[ $(git status --porcelain 2>/dev/null | wc -l) -gt 0 ]]; then
            branch="$branch *"  # Indicate uncommitted changes
        fi
    fi
    echo "$branch"
}

# Function to get the timestamp in EST and UTC
get_timestamp() {
    local est_time=$(TZ="America/Indiana/Indianapolis" date +"%Y-%m-%d (%I:%M:%S %p) EST")
    local utc_time=$(date -u +"%Y-%m-%d (%H:%M:%S) UTC")
    echo "$est_time | $utc_time"
}

# Update the PS1 prompt
function _update_ps1() {
    local timestamp=$(get_timestamp)
    local git_branch=$(parse_git_branch)
    PS1="[$timestamp] \[\033[01;34m\]\w\[\033[00m\] on \[\033[01;31m\]$git_branch\[\033[00m\]\n(ins)> "
}

PROMPT_COMMAND="_update_ps1"

