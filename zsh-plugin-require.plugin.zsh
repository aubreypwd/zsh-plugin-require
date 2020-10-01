#!/bin/zsh

###
 # Require a command (and install if missing).
 #
 # E.g: require "git" "brew reinstall git"
 #
 # @since Sun June 9th 2019
 # @since 1.0.0
 ##
function require {
	cmd="$1"
	install="$2"

	if ! [ -x "$(command -v $cmd)" ]; then
		echo "Could not find $cmd, installing using: $install..."
		eval ${install}
	fi
}
