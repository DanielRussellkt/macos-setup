#!/usr/bin/env bash

# Requires zsh and git to be installed by brew installation script
# Install powerline fonts for MUH AESTHETICS
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
#Cleanup
cd ..
rm -rf fonts

# Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Placing .zshrc file in home directory
cp ../config-files/.zshrc ~/.zshrc

# Installing Plugins
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Now zsh is configured, placing hyper configuration in correct directory
echo "Copying hyper.js config, hyper will likely need a full reload before picking this up and downloading plugins"
cp ../config-files/.hyper.js ~/.hyper.js