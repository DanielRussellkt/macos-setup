# macos-setup
A repository for automating macOSX setup contains various scripts for editing macos settings, installing required apps, and configuring various services. Not completely writing up much in the readme as its still a WIP.

Script Reference:

install-brew.sh - Ensures brew is installed, and once it is, iterates through all text files in the installations folder installing the program declared. Text files work irrespective of name as long as they are new-line delimited.

configuration-scripts/hyper-zsh-setup.sh - Sets up Hyper terminal emulator, and zsh, and configures it to my preferences.

configuration-scripts/osx-config.sh - Changes macos settings to something more sensible, including UI, mouse, keyboard etc. Also installs UK ISO windows keyboard layout because the mac one is useless. This requires the contents of kb-layout.zip to be extracted

configuration-scripts/ssh-setup.sh - Generates ssh key and configures the ssh agent

configuration-scripts/vscode-config.sh - Configures vscode plugins, useful starting point
