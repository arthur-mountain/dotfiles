#!/usr/bin/env bash

tmux_setup() {
	if [ -L "$HOME/.tmux.conf" ]; then
		ln -si "$DOTFILES/tmux/tmux.conf" "$HOME/.tmux.conf"
	else
		ln -s "$DOTFILES/tmux/tmux.conf" "$HOME/.tmux.conf"
	fi
}

# tmux_setup
