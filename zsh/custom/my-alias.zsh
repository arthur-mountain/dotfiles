# Reload zsh config
alias reload=". ~/.zshrc"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
 
# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Cleanup jdtls cache
function jdtlsCleanup() {
  local JDTLS_CACHE_PATH="$HOME/.cache/nvim/jdtls";
  if [ ! -d "$JDTLS_CACHE_PATH" ]; then
    echo -e "No jdtls cache found. Skipping cleanup."
    return
  fi

  projects=$(ls -A "$JDTLS_CACHE_PATH")
  if [ -z "$projects" ]; then
    echo -e "No jdtls build project found."
    return
  fi

  PS3="Select a project to clean: "
  select project_name in $projects; do
    if [ -z "$project_name" ]; then
      echo -e "\nError: Invalid selection. Please try again."
      return
    fi

    if [ -d "$JDTLS_CACHE_PATH/$project_name" ]; then
      echo -e "\nRemoving cache for project at '$JDTLS_CACHE_PATH/$project_name'."
      rm -rf "$JDTLS_CACHE_PATH/$project_name"
      return 
    fi

    echo -e "\nWarning: No cache directory found for the selected project($JDTLS_CACHE_PATH/$project_name)."
  done
}

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
# alias ..="cd .."
# alias ...="cd ../.."
# alias ....="cd ../../.."
# alias .....="cd ../../../.."

# Shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"

# Get week number
alias week='date +%V'

# Editor
if command -v nvim >/dev/null 2>&1; then
    alias v='nvim'
    alias vim='nvim'
fi

# Lazy git
if command -v lazygit >/dev/null 2>&1; then
  alias lg='lazygit'
fi

# Tmux
if command -v tmux >/dev/null 2>&1; then
  alias tm='tmux'
  alias tma='tmux attach'
  alias tmat='tmux attach -t'
  alias tmns='tmux new-session -dAs'
fi

