#!/bin/bash

# name of directory that this script is in, so it can be run from anywhere
PLY_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# create the /etc/plymouth/ directory if it doesn't exist
sudo mkdir -p /etc/plymouth/

# copy the plymouth config
sudo cp $PLY_DIR/plymouthd.conf /etc/plymouth/plymouthd.conf
