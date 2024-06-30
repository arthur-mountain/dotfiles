#!/usr/bin/env bash

gray() {
	echo -e "\033[1;38;5;243m$1\033[0m"
}

dark_gray() {
	echo -e "\033[1;30m$1\033[0m"
}

red() {
	echo -e "\033[1;31m$1\033[0m"
}

green() {
	echo -e "\033[1;32m$1\033[0m"
}

yellow() {
	echo -e "\033[1;33m$1\033[0m"
}

blue() {
	echo -e "\033[1;34m$1\033[0m"
}

purple() {
	echo -e "\033[1;35m$1\033[0m"
}

cyan() {
	echo -e "\033[1;36m$1\033[0m"
}

white() {
	echo -e "\033[1;37m$1\033[0m"
}

# tests
# gray "This is gray"
# dark_gray "This is dark gray"
# red "This is red"
# green "This is green"
# yellow "This is yellow"
# blue "This is blue"
# purple "This is purple"
# cyan "This is cyan"
# white "This is white"
