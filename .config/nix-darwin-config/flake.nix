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
      environment.systemPackages =
        [ pkgs.vim
          pkgs.alacritty
          pkgs.fastfetch
          pkgs.flameshot
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
        dock.autohide = true;
        dock.expose-animation-duration = 0.05;
        dock.launchanim = false;
        dock.mineffect = "scale";
        dock.mru-spaces = false;
        dock.orientation = "left";
        spaces.spans-displays = true;
        dock.static-only = true;
        dock.tilesize = 48;
        dock.wvous-bl-corner = 11; # Launchpad
        dock.wvous-tl-corner = 13; # Lock Screen
        dock.wvous-tr-corner = 12; # Notification Center
        finder._FXShowPosixPathInTitle = true;
        finder.AppleShowAllExtensions = true;
        finder.FXPreferredViewStyle = "Nlsv";
        finder.ShowPathbar = true;
        LaunchServices.LSQuarantine = false;
        NSGlobalDomain.AppleEnableMouseSwipeNavigateWithScrolls = true;
        NSGlobalDomain.AppleEnableSwipeNavigateWithScrolls = true;
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain.ApplePressAndHoldEnabled = false;
        NSGlobalDomain.AppleScrollerPagingBehavior = true;
        NSGlobalDomain.AppleShowAllExtensions = true;
        NSGlobalDomain.InitialKeyRepeat = 10;
        NSGlobalDomain.KeyRepeat = 1;
        NSGlobalDomain.NSAutomaticWindowAnimationsEnabled = false;
        NSGlobalDomain.NSDocumentSaveNewDocumentsToCloud = false;
        NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
        NSGlobalDomain.NSNavPanelExpandedStateForSaveMode2 = true;
        NSGlobalDomain._HIHideMenuBar = true;
        NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;
        NSGlobalDomain."com.apple.trackpad.enableSecondaryClick" = true;
        screensaver.askForPasswordDelay = 10;
        SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;
        trackpad.Clicking = true;
        trackpad.Dragging = true;
        trackpad.TrackpadRightClick = true;
      };
      security.pam.enableSudoTouchIdAuth = true;

      homebrew = {
        enable = true;
        brews = [
          "glab"
        ];
        casks = [
          "postman"
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
