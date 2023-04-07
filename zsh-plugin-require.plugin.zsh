#!/bin/sh

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
require () {

	CMD="$1"
	INSTALL="$2"
	MANAGER="$3"

	if [ -n "$MANAGER" ] && ! [ -x "$(command -v "$MANAGER")" ]; then

		echo "Required package manager command '$MANAGER' not found, please install missing command '$CMD' so we can automatically handle dependancies."

		return 1
	fi

	if alias "$CMD" >/dev/null 2>&1; then

		# The required command is an alias, we'll just have to trust them.
		return 0
	fi

	if ! [ -x "$(command -v "$CMD")" ]; then

		# Add export REQUIRE_AUTO_INSTALL="off" to .zshrc to stop auto installation.
		if [ "off" = "$REQUIRE_AUTO_INSTALL" ]; then

			echo "Could not find '$CMD' command and it is required, some functionality may not work until you install it."

			return 1
		fi

		echo "Could not find '$CMD' command, installing using: $INSTALL..."
		eval "${INSTALL}"
	fi

	return 0
}
