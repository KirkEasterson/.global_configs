#!/bin/bash

# name of directory that this script is in, so it can be run from anywhere
LLS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# fetch the latest version
LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' https://github.com/sumneko/lua-language-server/releases/latest)
LATEST_VERSION=$(echo $LATEST_RELEASE | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
LATEST_FILE="lua-language-server-$LATEST_VERSION-linux-x64.tar.gz"
ARTIFACT_URL="https://github.com/sumneko/lua-language-server/releases/download/$LATEST_VERSION/$LATEST_FILE"
wget -O $LLS_DIR/$LATEST_FILE $ARTIFACT_URL

# extract the download
mkdir -p $LLS_DIR/lua-language-server-bin
tar -xf $LLS_DIR/$LATEST_FILE -C $LLS_DIR/lua-language-server-bin/
rm $LLS_DIR/$LATEST_FILE

# move the files to /bin/
sudo rm -rf /bin/lua-language-server-bin
sudo mv -f $LLS_DIR/lua-language-server-bin /bin/
sudo cp $LLS_DIR/lua-language-server /bin/
