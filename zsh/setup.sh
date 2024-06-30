#!/usr/bin/env bash

zsh_setup() {
	if [ -L "$HOME/.zshrc" ]; then
		ln -si "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
	else
		ln -s "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
	fi

	for file in "$DOTFILES/zsh/custom"/*; do
		if [[ "$file" != "" ]]; then
			destination="$ZSH/custom/$(basename "$file")"

			if [ -L "$destination" ]; then
				ln -si "$file" "$destination"
			else
				ln -s "$file" "$destination"
			fi
		fi
	done
}

# zsh_setup
