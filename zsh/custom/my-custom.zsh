# Side project alias
function comeProject () {
  local COLOR_GREEN="\033[0;32m";
  local COLOR_RESET="\033[0m";
  local PROJECT_PATH=$1;
  local folders=($(ls $PROJECT_PATH));
  local endIdx=${#folders[*]};
  local folderIdx;
  local isOpenVscode

  if [[ $endIdx == 0 ]]; then
    cd $PROJECT_PATH
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

  cd $PROJECT_PATH/${folders[folderIdx]}
}

# Personal
alias mynode="comeProject ~/Desktop/projects"
alias mygo="comeProject ~/Desktop/go-projects"
alias myopensources="comeProject ~/Desktop/open-sources"

# Work
alias mywk="comeProject ~/Desktop/work"

