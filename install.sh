#!/usr/bin/env bash

#Prompt for password and keep sudo priveleges while script runs
sudo -v

. ./utils/sudo-funcs.sh --source-only

keepAlive

# Install all brew programs
/bin/bash install-brew.sh

# Configure osX preferences, git, hyperterm and ssh, along with all other scripts in configuration-scripts
# TODO: Doesn't currently work as all those config files are relative paths, seems like its calling the relative path from inside this script, which doesnt exist
# for script in ./configuration-scripts/*.sh; do
#   /bin/bash "$script" -H
# done