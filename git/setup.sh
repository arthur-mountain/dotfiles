#!/usr/bin/env bash

CONFIG_NAME=".gitconfig"
DESTINATION="$HOME/$CONFIG_NAME"

info "checking for $CONFIG_NAME"

if [ -f "$DESTINATION" ]; then
  success "the '$DESTINATION' exists, skip the following steps"
  return 0
fi

git_setup() {
  warning "$(yellow "Missing '$CONFIG_NAME', start creating...")"
  touch "$DESTINATION"
  success "created"

  space
  read -rp "Enter your git username: " user_name
  space
  [ -z "$user_name" ] && error "$(red 'username is required')\n"

  read -rp "Enter your git email: " user_email
  space
  [ -z "$user_email" ] && error "$(red 'email is required')\n"

  cat >"$DESTINATION" <<-EOF
[user]
  name = $user_name
  email = $user_email

[init]
  defaultBranch = main

[core]
  editor = nvim
  excludesfile = $DOT_FILE_PATH/.gitignore

[diff]
  algorithm = patience

[pull]
    rebase = true
EOF
}

# git_setup
