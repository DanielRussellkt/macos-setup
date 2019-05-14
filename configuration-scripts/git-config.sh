#!/usr/bin/env bash

# Import env variables
source ../env.sh

# Setting up Git user
git config --global user.email $EMAIL_ADDRESS
git config --global user.name $GIT_USER_NAME

# Prevents git commands from opening as if they've been piped into less, a change from Git 2.16
git config --global pager.branch false

# Enables git autocorrect with 5 seconds to cancel command
git config --global help.autocorrect 5