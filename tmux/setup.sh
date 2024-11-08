#!/usr/bin/env bash

tmux_setup() {
  if [ -L "$HOME/.tmux.conf" ]; then
    ln -si "$DOT_FILE_PATH/tmux/tmux.conf" "$HOME/.tmux.conf"
  else
    ln -s "$DOT_FILE_PATH/tmux/tmux.conf" "$HOME/.tmux.conf"
  fi
}

# tmux_setup
