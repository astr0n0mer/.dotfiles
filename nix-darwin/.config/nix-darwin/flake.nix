{
  description = "astr0n0mer's nix-darwin config";

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
          # pkgs.ansible
          pkgs.bat
          pkgs.cargo
          pkgs.docker
          pkgs.docker-compose
          pkgs.fastfetch
          pkgs.flameshot
          pkgs.fzf
          pkgs.gh
          pkgs.glab
          pkgs.glow
          pkgs.jnv
          pkgs.jq
          pkgs.lazydocker
          pkgs.lazygit
          pkgs.luajitPackages.luarocks
          pkgs.neovim
          # pkgs.openvpn # INFO: can't set this up to use .ovpn file
          pkgs.pipx
          pkgs.pyenv
          pkgs.ranger
          pkgs.ripgrep
          pkgs.slack-term
          pkgs.stow
          pkgs.syncthing
          pkgs.termusic
          pkgs.tlrc
          pkgs.tmux
          pkgs.tree
          pkgs.ttyper
          pkgs.typioca
          pkgs.vim
          pkgs.visidata
          pkgs.vscodium
          pkgs.weechat
          pkgs.zsh
          pkgs.zsh-powerlevel10k
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

      fonts = {
        packages = [
          pkgs.nerdfonts
          pkgs.sketchybar-app-font
        ];
      };
      networking = {
        hostName = "cube";
        localHostName = "cube";
      };
      # INFO: this is untested
      # users.users = {
      #   "tux" = {
      #     createHome = true;
      #   };
      # };
      security.pam.enableSudoTouchIdAuth = true;
      system.activationScripts = { # INFO: this is not working
        "postDarwinRebuild" = {
          # enable = true;
          text = ''
            echo "Running postDarwinRebuild script..." >> ~/postDarwinRebuild.log
          '';
        };
      };
      system.defaults = {
        CustomSystemPreferences = {
          universalaccess = { # INFO: this might be ineffective
            useVirtualKeyboard = true;
          };
        };
        dock = {
          autohide = true;
          expose-animation-duration = 0.05;
          # expose-group-by-app = true;
          launchanim = false;
          mineffect = "scale";
          mru-spaces = false;
          orientation = "left";
          static-only = true;
          tilesize = 40;
          wvous-tl-corner = 11; # Launchpad
          wvous-tr-corner = 12; # Notification Center
          wvous-bl-corner = 13; # Lock Screen
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
          _HIHideMenuBar = true;
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
      system.keyboard = {
          #! I use kanata for key-remapping on Linux
          enableKeyMapping = true;
          remapCapsLockToControl = true;
      };
      system.startup.chime = false;

      homebrew = {
        enable = true;
        taps = [
          "FelixKratz/formulae"
          "ggerganov/ggerganov"
          "koekeishiya/formulae"
          "ngrok/ngrok"
          "render-oss/render"
          {
            name = "zen-browser/browser";
            clone_target = "https://github.com/zen-browser/desktop.git";
            force_auto_update = true;
          }
        ];
        brews = [
          "FelixKratz/formulae/sketchybar"
          "ggerganov/ggerganov/hnterm"
          "koekeishiya/formulae/skhd"
          "koekeishiya/formulae/yabai"
          "mpv"
          "render-oss/render/render"
          "saml2aws"
          "terminal-notifier"
          "trash"
          "xdotool"
        ];
        casks = [
          "alacritty"
          "aws-vpn-client"
          "brave-browser"
          "cursor"
          "docker"
          "flameshot"
          "logseq"
          "mongodb-compass"
          "ngrok"
          "postman"
          "raycast"
          "slack"
          "studio-3t"
          "visual-studio-code"
          "zap"
          "zen-browser"
          "zoom"

          # INFO: font related casks
          "font-sf-pro"
          "sf-symbols"
        ];
        caskArgs = {
          no_quarantine = true;
        };
      };

      services = {
        sketchybar.enable = true;
        skhd.enable = true;
        yabai.enable = true;
      };

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."cube" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."cube".pkgs;
  };
}
