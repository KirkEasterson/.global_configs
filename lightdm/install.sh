#!/bin/bash

# name of directory that this script is in, so it can be run from anywhere
LIGHTDM_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# copy greeter wallpaper
sudo cp $LIGHTDM_DIR/wall.jpg /usr/share/pixmaps/wall.jpg

# create the /etc/lightdm/ dir if ti doesn't exist
sudo mkdir -p /etc/lightdm/

# copy the slick greeter config
sudo cp $LIGHTDM_DIR/slick-greeter.conf /etc/lightdm/slick-greeter.conf
