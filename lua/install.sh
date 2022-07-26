#!/bin/bash

# fetch the latest version
LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' https://github.com/sumneko/lua-language-server/releases/latest)
LATEST_VERSION=$(echo $LATEST_RELEASE | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
LATEST_FILE="lua-language-server-$LATEST_VERSION-linux-x64.tar.gz"
ARTIFACT_URL="https://github.com/sumneko/lua-language-server/releases/download/$LATEST_VERSION/$LATEST_FILE"
wget -O $LATEST_FILE $ARTIFACT_URL

# extract the download
mkdir -p lua-language-server-bin
tar -xf $LATEST_FILE -C lua-language-server-bin/
rm $LATEST_FILE

# move the files to /bin/
sudo rm -rf /bin/lua-language-server-bin
sudo mv -f lua-language-server-bin /bin/
sudo cp lua-language-server /bin/
