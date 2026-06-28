#!/bin/bash

echo 'Linking ssh'

# Remove old files
rm -f ~/.ssh/ssh-servers
rm -f ~/.ssh/config
rm -f ~/.ssh/generic-config

# Only SSH versions 7.3p1 and up support "Include" in ssh config files
# Get ssh version
SSH_VERSION=($(ssh -V 2>&1 | grep -oE '[0-9]+' | head -2))
SSH_VERSION_MAJOR=${SSH_VERSION[0]}
SSH_VERSION_MINOR=${SSH_VERSION[1]}

echo "SSH version: $SSH_VERSION_MAJOR:$SSH_VERSION_MINOR"

# If include is not supported
if (($SSH_VERSION_MAJOR < 7 || $SSH_VERSION_MAJOR == 7 && $SSH_VERSION_MINOR < 3)); then
	ln -s ~/.dotfiles/ssh/ssh-config/ssh-servers ~/.ssh/config
else
	echo "Linking generic SSH config"

	# Link ssh files to be included
	ln -s ~/.dotfiles/ssh/ssh-config/ssh-servers ~/.ssh/ssh-servers
	ln -s ~/.dotfiles/ssh/ssh-config/generic-config ~/.ssh/generic-config

	# Link ssh config file depending on whether we are running on Mac or Linux
	if [ "$(~/.dotfiles/scripts/is-mac.sh)" == 1 ]; then
		ln -s ~/.dotfiles/ssh/ssh-config/mac-config ~/.ssh/config
	else
		ln -s ~/.dotfiles/ssh/ssh-config/linux-config ~/.ssh/config
	fi
fi
