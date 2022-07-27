#!/bin/bash

# name of directory that this script is in, so it can be run from anywhere
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# iterate through all directories, and run install.sh if it exists
for dir in $SCRIPT_DIR/*/; do
	if [ -f "$dir/install.sh" ]; then
		source "$dir/install.sh"
	fi
done
