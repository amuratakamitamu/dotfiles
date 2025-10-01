#!/bin/bash
# Get the latest version of VSCode
wget -O /tmp/vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

# Install the deb package
sudo dpkg -i /tmp/vscode.deb

# Clean up
rm /tmp/vscode.deb
