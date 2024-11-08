#!/usr/bin/env bash

zsh_setup() {
  if [ -L "$HOME/.zshrc" ]; then
    ln -si "$DOT_FILE_PATH/zsh/.zshrc" "$HOME/.zshrc"
  else
    ln -s "$DOT_FILE_PATH/zsh/.zshrc" "$HOME/.zshrc"
  fi

  for file in "$DOT_FILE_PATH/zsh/custom"/*; do
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
