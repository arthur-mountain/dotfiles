# Side project alias
function comeProject () {
  local COLOR_GREEN="\033[0;32m";
  local COLOR_RESET="\033[0m";
  local PROJECT_PATH="$HOME/Desktop/$1";
  local folders=($(ls "$PROJECT_PATH"));
  local endIdx=${#folders[*]};
  local folderIdx;
  local isOpenVscode

  if [[ $endIdx == 0 ]]; then
    cd "$PROJECT_PATH"
    return
  fi

  for idx in {1..$endIdx}
  do
    echo -e "$idx: ${folders[$idx]}"
  done;

  echo -e "\ndefault folder is ${COLOR_GREEN}${PROJECT_PATH}${COLOR_RESET}"
  echo -e "folder number is: "
  read folderIdx
 
  # echo -e "open with neovim(pressed enter/n)"
  #
  # read isEnter
  #
  # if [[ $isEnter == '' ]]; then
  #   nvim $PROJECT_PATH/${folders[folderIdx]}
  #
  #   if [ $? != 0 ]; then
  #     echo 'open nvim failure'
  #   fi
  # fi

  cd "$PROJECT_PATH/${folders[folderIdx]}"
}

# Personal
alias myopensources="comeProject open-sources"
alias mynode="comeProject projects-javascript"
alias myjava="comeProject projects-java"
alias mygo="comeProject projects-golang"
alias myswift="comeProject projects-swift"
alias mydaodao="comeProject daodao"

# Work
alias mywk="comeProject projects-work"

