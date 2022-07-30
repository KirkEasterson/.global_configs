#!/bin/bash

# name of directory that this script is in, so it can be run from anywhere
SD_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# add name of script dynamically in case the name is changed
SCRIPT_NAME=(`basename "$0"`)
sudo mkdir -p /etc/systemd/logind.conf.d/

# iterate through all files in this directory
for entry in `ls -aA $SD_DIR`; do

	# if current entry is not this script of doesn't end with .conf
	if [[ $SCRIPT_NAME != $entry ]] && [[ $entry == *.conf ]]; then

		dest=/etc/systemd/logind.conf.d/$entry
		src=$SD_DIR/$entry

		# if content already in dest file; is false if dest doesn't exist
		if grep -qFf "$src" "$dest" 2>/dev/null; then
			continue
		fi

		# if dest doesn't exist, create it
		if [ ! -f "$dest" ]; then
			sudo touch $dest
		fi

		echo "" | sudo tee -a $dest >/dev/null
		echo "$(cat $src)" | sudo tee -a $dest >/dev/null
		echo "" | sudo tee -a $dest >/dev/null
	fi
done
