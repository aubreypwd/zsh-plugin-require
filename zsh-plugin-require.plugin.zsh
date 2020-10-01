#!/bin/zsh

###
 # Require a command (and install if missing).
 #
 # E.g: require "git" "brew reinstall git"
 #
 #     This will simply run the command as the 2nd option.
 #
 # E.g: require "git" "brew reinstall git" "brew"
 #
 #     This will only run the command if a package manager as the 3rd option is present, e.g. `brew`.
 #
 # @since Sun June 9th 2019
 # @since 1.0.0
 ##
function require {
	local cmd="$1"
	local install="$2"
	local manager="$3"

	if ! [ -z $manager ] && ! [ -x "$(command -v $manager)" ]; then
		echo "Package manger $manager not found, please install $cmd using your favorite package manager."
		return
	fi

	if ! [ -x "$(command -v $cmd)" ]; then
		echo "Could not find $cmd, installing using: $install..."
		eval ${install}
	fi
}
