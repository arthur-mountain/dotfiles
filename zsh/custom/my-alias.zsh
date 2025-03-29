# Reload zsh config
alias reload=". ~/.zshrc"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
 
# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Configs
alias dotfile="cd ~/.dotfiles"

# Print prettily
alias path='echo $PATH | tr -s ":" "\n"'
function envVars () {
  if [ -z "$1" ]; then
    echo "Usage: envVars <file>"
    return 1
  fi
  cat "$1"| egrep -v "^#" | sort | awk -F '=' '{print $1}' | sed '/^$/d'
}

# Easier navigation: .., ..., ...., .....
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"

# Get week number
alias week='date +%V'

# Editor
if [[ -n "$(command -v nvim)" ]]; then
    alias v='nvim'
    alias vim='nvim'
fi

# Lazy git
if [[ -n "$(command -v lazygit)" ]]; then
  alias lg='lazygit'
fi

# Tmux
if [[ -n "$(command -v tmux)" ]]; then
  alias tm='tmux'
  alias tma='tmux attach'
  alias tmat='tmux attach -t'
  alias tmns='tmux new-session -dAs'
fi

