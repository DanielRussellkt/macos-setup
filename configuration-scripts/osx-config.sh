#!/usr/bin/env bash

# Close system preference panes
osascript -e 'tell application "System Preferences" to quit'

sudo -v

. ../utils/sudo-funcs.sh --source-only

keepAlive

#############################################
# Input/Output Devices                      #
#############################################

# T R A C K P A D
# Enable trackpad tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Use scroll gesture with the Ctrl (^) modifier key to zoom
sudo defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
sudo defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

#Disable swiping back in chrome
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

# K E Y B O A R D
# Script to configure macos to use a normal windows keyboard layout, because I would rather die than use the ANSI-ISO bastard that OSX uses
# Place UK ISO QWERTY windows keyboard layout in the appropriate folder, if it isn't already there
if [[ $(find ~/Library/Keyboard\ Layouts/British-Windows-2.rsrc) ]]; then
    echo "British PC keyboard layout already exists"
else
    cp ../config-files/British-Windows-2.rsrc ~/Library/Keyboard\ Layouts/British-Windows-2.rsrc
fi
#TODO: Going to need to unzip this here, can't store this .rsrc file in github

#Configure Language & Region > Keyboard Preferences to use the new layout
defaults write com.apple.HIToolbox AppleCurrentKeyboardLayoutInputSourceID -string 'com.apple.keylayout.British-PC'
defaults write com.apple.HIToolbox AppleEnabledInputSources -array '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>250</integer><key>KeyboardLayout Name</key><string>British-PC</string></dict>'
defaults write com.apple.HIToolbox AppleInputSourceHistory -array '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>250</integer><key>KeyboardLayout Name</key><string>British-PC</string></dict>'
defaults write com.apple.HIToolbox AppleSelectedInputSources -array '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>250</integer><key>KeyboardLayout Name</key><string>British-PC</string></dict>'

# Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# A U D I O
# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

#############################################
# Timeouts and power saving                 #
#############################################

# Never go into computer sleep mode
sudo systemsetup -setcomputersleep Off > /dev/null

# Disable hibernation (speeds up entering sleep mode)
sudo pmset -a hibernatemode 0

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

#############################################
# Mac OS UI                                 #
#############################################

# G E N E R A L
# Set pink highlight
defaults write NSGlobalDomain AppleHighlightColor -string "1.000000 0.749020 0.823529"

# Set pink accent colour
defaults write NSGlobalDomain AppleAccentColor -int 6

# Adds icons to the menu bar
defaults write com.apple.systemuiserver menuExtras -array \
"/System/Library/CoreServices/Menu Extras/AirPort.menu" \
"/System/Library/CoreServices/Menu Extras/Battery.menu" \
"/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
"/System/Library/CoreServices/Menu Extras/Clock.menu" \
"/System/Library/CoreServices/Menu Extras/Displays.menu" \
"/System/Library/CoreServices/Menu Extras/TextInput.menu" \
"/System/Library/CoreServices/Menu Extras/User.menu" \
"/System/Library/CoreServices/Menu Extras/Volume.menu"

# W A R N I N G S   A N D   P O P - U P S
# Disable “Are you sure you want to open this application?”
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Disable the warning when emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# U I   C L E A R - U P
# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Disable that horrific notification centre
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

# F I N D E R
# Disable finder animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# D O C K
# Remove icons from dock - Gets rid of all that bloatware and saves cleanup
defaults write com.apple.dock persistent-apps -array

# Automatically hide dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0

# Make dock icons tiny
defaults write com.apple.dock tilesize -int 38

# Show indicators for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

#############################################
# Clean-up                                  #
#############################################

# Killing apps
for app in "Activity Monitor" \
	"Address Book" \
	"Calendar" \
	"cfprefsd" \
	"Dock" \
	"Finder" \
	"Google Chrome" \
	"SystemUIServer"; do
	killall "${app}" &> /dev/null
done

echo "OSX Changes made, restart required for some to take effect"