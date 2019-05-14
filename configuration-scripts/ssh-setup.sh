#!/usr/bin/env bash

sudo -v

# Import env variables
source ../env.sh

#Generates key for my git handle
if find ~/.ssh -mindepth 1 -print -quit 2>/dev/null | grep -q .; then
    echo "SSH key already exists at ~/.ssh/"
    # exit 1
else
    ssh-keygen -t rsa -b 4096 -C $EMAIL_ADDRESS -N '' -f ~/.ssh/id_rsa
fi

#Start the SSH agent in the background
eval "$(ssh-agent -s)"

#Copy SSH config file to correct directory - Allows autoloading of SSH keys by the agent
cp ../config-files/ssh-config ~/.ssh/config

#Add SSH key to SSH agent
ssh-add -K ~/.ssh/id_rsa