{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = [
          pkgs.alacritty
          pkgs.bat
          pkgs.cargo
          pkgs.fastfetch
          pkgs.flameshot
          pkgs.fzf
          pkgs.ranger
          pkgs.slack-term
          pkgs.stow
          pkgs.termusic
          pkgs.tree
          pkgs.ttyper
          pkgs.typioca
          pkgs.vim
        ];

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 4;

      system.defaults = {
        dock = {
          autohide = true;
          expose-animation-duration = 0.05;
          # expose-group-by-app = true;
          launchanim = false;
          mineffect = "scale";
          mru-spaces = false;
          orientation = "left";
          static-only = true;
          tilesize = 48;
          wvous-bl-corner = 11; # Launchpad
          wvous-tl-corner = 13; # Lock Screen
          wvous-tr-corner = 12; # Notification Center
        };
        finder = {
          _FXShowPosixPathInTitle = true;
          AppleShowAllExtensions = true;
          AppleShowAllFiles = true;
          FXPreferredViewStyle = "Nlsv";
          ShowPathbar = true;
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
          _HIHideMenuBar = false;
          "com.apple.mouse.tapBehavior" = 1;
          "com.apple.trackpad.enableSecondaryClick" = true;
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
      };
      system.keyboard = {
          #! I use kanata for key-remapping
          # enableKeyMapping = true;
          # remapCapsLockToControl = true;
      };
      security.pam.enableSudoTouchIdAuth = true;

      homebrew = {
        enable = true;
        brews = [
          "glab"
        ];
        casks = [
          # "brave-browser"
          # "logseq"
          "postman"
          # "raycast"
          # "slack"
          # "studio-3t"
        ];
        caskArgs = {
          no_quarantine = true;
        };
      };

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."bug-factory" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."bug-factory".pkgs;
  };
}
