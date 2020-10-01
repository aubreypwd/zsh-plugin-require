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
		echo "Required package manager command '$manager' not found, please install missing command '$cmd'."
		return
	fi

	if ! [ -x "$(command -v $cmd)" ]; then

		# Add export REQUIRE_AUTO_INSTALL="off" to .zshrc to stop auto installation.
		if [[ "off" = "$REQUIRE_AUTO_INSTALL" ]]; then
			echo "Could not find '$cmd' command and it is required, some functionality may not work until you install it."
			return
		fi

		echo "Could not find '$cmd' command, installing using: $install..."
		eval ${install}
	fi
}
