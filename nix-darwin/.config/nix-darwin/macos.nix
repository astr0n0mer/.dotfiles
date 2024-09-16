{ pkgs, ... }:

let
  homebrewConfig = import ./homebrew.nix { inherit pkgs; };
in
{
  homebrew = homebrewConfig;
  security.pam.enableSudoTouchIdAuth = true;
  services = {
    # sketchybar.enable = true;
    # skhd.enable = true;
    # yabai.enable = true;
  };
  system = {
    activationScripts = { # INFO: this is not working
      "postDarwinRebuild" = {
        # enable = true;
        text = ''
          echo "Running postDarwinRebuild script..." >> ~/postDarwinRebuild.log
        '';
      };
    };
    defaults = {
      CustomUserPreferences = {
        "com.apple.dock" = {
          expose-group-apps = true;
        };
        universalaccess = { # INFO: this might be ineffective
          useVirtualKeyboard = true;
        };
      };
      dock = {
        autohide = true;
        expose-animation-duration = 0.05;
        expose-group-by-app = true;
        launchanim = false;
        mineffect = "scale";
        mru-spaces = false;
        orientation = "left";
        static-only = true;
        tilesize = 40;
        wvous-bl-corner = 13; # Lock Screen
        wvous-tl-corner = 11; # Launchpad
        wvous-tr-corner = 12; # Notification Center
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        FXPreferredViewStyle = "Nlsv";
        ShowPathbar = true;
        _FXShowPosixPathInTitle = true;
      };
      LaunchServices = {
        LSQuarantine = false;
      };
      NSGlobalDomain = {
        AppleEnableMouseSwipeNavigateWithScrolls = true;
        AppleEnableSwipeNavigateWithScrolls = true;
        AppleInterfaceStyle = "Dark";
        ApplePressAndHoldEnabled = false;
        AppleScrollerPagingBehavior = true;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        InitialKeyRepeat = 10;
        KeyRepeat = 1;
        NSAutomaticWindowAnimationsEnabled = false;
        NSDocumentSaveNewDocumentsToCloud = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
        NSWindowShouldDragOnGesture = true;
        _HIHideMenuBar = false;
        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.trackpad.enableSecondaryClick" = true;
      };
      screencapture = {
        location = "~/Downloads/screenshots";
      };
      screensaver = {
        askForPasswordDelay = 10;
      };
      spaces = {
        spans-displays = false;
      };
      SoftwareUpdate = {
        AutomaticallyInstallMacOSUpdates = false;
      };
      trackpad = {
        Clicking = true;
        Dragging = true;
        TrackpadRightClick = true;
      };
      # INFO: need to provide "Full Disk Access" to the terminal emulator (Alacritty in this case)
      # INFO: `open "x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles"`
      # universalaccess = {
      #   reduceMotion = true;
      # };
    };
    keyboard = {
      #! I use kanata for key-remapping on Linux
      enableKeyMapping = true;
      remapCapsLockToControl = true;
      swapLeftCommandAndLeftAlt = true;
    };
    startup = {
      chime = false;
    };
  };
  time.timeZone = "Asia/Calcutta";
  # INFO: this is untested
  # users.users = {
  #   "tux" = {
  #     createHome = true;
  #   };
  # };
}
