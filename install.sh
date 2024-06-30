#!/usr/bin/env bash

# provide a set of theme functions
. ./theme.sh

run() {
	local title="$1"
	local setup="$2"

	echo -e "$(gray "========= $(purple "Setting up $title START") =========")"

	$setup

	echo -e "$(gray "========= $(purple "Setting up $title END")   =========")"
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

# echo -e "Enter the path to the dotfiles directory: "
# read DOTFILES
# echo -e

if [[ "$DOTFILES" == "" ]]; then
	DOTFILES="$(pwd)"
fi

case "$1" in
homebrew)
	# run "Setting up Homebrew" setup_homebrew
	;;
zsh)
	run "ZSH" ". ./zsh/setup.sh"
	;;
*)
	echo -e $"\n$(red "Usage"): $(basename "$0") {homebrew|zsh}\n"
	exit 1
	;;
esac

success "\nDone."
