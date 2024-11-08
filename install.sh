#!/usr/bin/env bash

set -e

# provide a set of theme functions
. ./theme.sh

run() {
  local title="$1"
  local setup="$2"

  echo -e "$(gray "========= $(purple "Setting up $title START") =========")\n"

  $setup

  echo -e "\n$(gray "========= $(purple "Setting up $title END")   =========")\n"
}

error() {
  echo -e "$(red "Error:") $1"
  exit 1
}

warning() {
  echo -e "$(yellow "Warning:") $1"
}

info() {
  echo -e "$(blue "Info:") $1"
}

success() {
  echo -e "$(green "$1")"
}

space() {
  echo
}

####################################
############ Homebrew ##############
####################################
setup_homebrew() {
  if test ! "$(command -v brew)"; then
    info "Homebrew not installed. Installing."
    # Run as a login shell (non-interactive) so that the script doesn't pause for user input
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash --login
  fi

  # install brew dependencies from Brewfile
  brew bundle
}

echo "Enter the path to the dotfiles directory(default is '$(pwd)'): "
read -r DOT_FILE_PATH
space

if [ -z "$DOT_FILE_PATH" ]; then
  DOT_FILE_PATH="$(pwd)"
else
  [ ! -d "$DOT_FILE_PATH" ] && error "$(red 'Invalid path')"
fi

case "$1" in
homebrew)
  run "Setting up Homebrew" setup_homebrew
  ;;
zsh)
  run "ZSH Setup" ". ./zsh/setup.sh"
  ;;
tmux)
  run "Tmux Setup" ". ./zsh/setup.sh"
  ;;
git)
  run "Git Setup" ". ./git/setup.sh"
  ;;
nvim)
  run "Neovim Setup"
  # if [ -L "$HOME/.config/nvim" ]; then
  #   ln -si "$DOT_FILE_PATH/nvim" "$HOME/.config/nvim"
  # else
  #   ln -s "$DOT_FILE_PATH/nvim" "$HOME/.config/nvim"
  # fi
  ;;
*)
  echo -e "Not support all setup oprations. Please choose from the following:\n"
  echo -e "$(red "Usage"): $(basename "$0") {homebrew|zsh|tmux|git}\n"
  exit 1
  ;;
esac

success "\nDone."
