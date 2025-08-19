DESIRED_HOSTNAME="cube"
sudo scutil --set ComputerName "$DESIRED_HOSTNAME"
sudo scutil --set LocalHostName "$DESIRED_HOSTNAME"
# INFO: use foll. commands to confirm the above change
# scutil --get ComputerName
# scutil --get LocalHostName


defaults write com.apple.controlcenter BatteryShowPercentage -bool true

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock expose-animation-duration -float 0.05
defaults write com.apple.dock expose-group-apps -bool true
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock static-only -bool true
defaults write com.apple.dock tilesize -int 40
defaults write com.apple.dock wvous-bl-corner -int 13 # Lock Screen
defaults write com.apple.dock wvous-tl-corner -int 11 # Launchpad
defaults write com.apple.dock wvous-tr-corner -int 12 # Notification Center

defaults write com.apple.finder AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "clmv" # INFO: Column View
defaults write com.apple.finder FXRemoveOldTrashItems -bool true
defaults write com.apple.finder NewWindowTarget -string "PfHm" # INFO: Home Directory
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

defaults write com.apple.LaunchServices LSQuarantine -bool false

defaults write com.apple.menuextra.clock ShowAMPM -bool false
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool false

defaults write NSGlobalDomain AppleEnableMouseSwipeNavigateWithScrolls -bool true
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true
defaults write NSGlobalDomain AppleICUForce12HourTime -bool true
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain AppleScrollerPagingBehavior -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain InitialKeyRepeat -int 10
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain NSWindowShouldDragOnGesture -bool true
defaults write NSGlobalDomain _HIHideMenuBar -bool false
defaults write com.apple.mouse.tapBehavior -int 1
defaults write com.apple.trackpad.enableSecondaryClick -bool true

DESIRED_SCREENSHOT_LOCATION="$HOME/Downloads/screenshots"
defaults write com.apple.screencapture disable-shadow -bool true
mkdir -p "$DESIRED_SCREENSHOT_LOCATION" 2>/dev/null && \
	defaults write com.apple.screencapture location -string "$DESIRED_SCREENSHOT_LOCATION"

defaults write com.apple.screensaver askForPasswordDelay -int 10

defaults write com.apple.spaces spans-displays -bool false

defaults write com.apple.SoftwareUpdate AutomaticallyInstallMacOSUpdates -bool false

defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadMomentumScroll -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

# defaults write NSGlobalDomain AppleKeyboardUIMode -int 3 # INFO: Enable keyboard access to all controls (approximation of enableKeyMapping)

sudo nvram SystemAudioVolume=" " # INFO: startup.chime = false

# sudo systemsetup -listtimezones # INFO: check available timezones
sudo systemsetup -settimezone "Asia/Calcutta" # INFO: This line throws error code 99 but successfully changes the timezone
