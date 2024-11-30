{
  description = "astr0n0mer's nix-darwin configuration";

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
      environment.systemPackages = with pkgs; [
          # act
          # ansible
          # bat # INFO: cat clone with wings
          # btop
          cargo # INFO: rust package manager
          # circumflex # INFO: Hacker News TUI
          # clipse # INFO: clipboard manager TUI
          # curl
          # delta
          # direnv
          # docker
          # docker-client
          # docker-compose
          # fastfetch # INFO: neofetch successor
          # firebase-tools
          # flameshot # INFO: screenshot tool
          # fzf # INFO: fuzzy finder
          # gh # INFO: GitHub CLI
          # glab # INFO: GitLab CLI
          # glow # INFO: markdown reader
          # jnv # INFO: interactive json viewer with `jq` syntax
          # jq # INFO: json processor
          # lazydocker # INFO: docker TUI
          # lazygit # INFO: git TUI
          # lazysql
          luajitPackages.luarocks # INFO: lua package manager
          # man-pages-posix
          # neomutt # INFO: email client TUI
          # neovim # INFO: vim successor
          # openvpn # INFO: can't set this up to use .ovpn file
          # pipx # INFO: python package manager
          # podman # INFO: container runtime
          # podman-compose
          # pyenv # INFO: python version manager
          # ranger # INFO: file manager TUI
          # ripgrep # INFO: faster grep
          # ruff # INFO: python formatter, linter
          # slack-term
          # stow # INFO: symlink manager
          # syncthing # INFO: file sync on local network
          # termusic
          # terraform # INFO: infrastructure as code
          # tlrc # INFO: tldr of CLI commands
          # tmux # INFO: terminal multiplexer
          # tokei # INFO: code statistics
          # tree # INFO: directory tree viewer
          ttyper # INFO: typing practice
          typioca # INFO: typing practice
          # up # INFO: ultimate plumber
          # uv # INFO: python
          # vim # INFO: text editor
          visidata # INFO: spreadsheet TUI
          # vscodium # INFO: vscode without telemetry # TODO: to be replaced with windsurf post 2024/12/30
          # weechat # INFO: IRC client
          # yazi # INFO: file manager TUI
          # zsh
          # zsh-powerlevel10k
        ];

      # nixpkgs.config = {
      #   # Set this to true to allow all unfree packages
      #   # allowUnfree = true;
      #
      #   # Allow unfree packages only for specific packages
      #   allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
      #     "terraform"
      #   ];
      # };

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
        packages = with pkgs; [
          nerdfonts
          # sketchybar-app-font
        ];
      };
      launchd.agents = {
        "crontab_agent" = {
          serviceConfig = {
            Label = "crontab_afk_slackbot";
            Program = "${pkgs.curl}/bin/curl";
            ProgramArguments = [
              "--location"
              "https://afk-slackbot.onrender.com"
            ];
            StartInterval = 720;
          };
        };
        # "clipse_agent" = {
        #   serviceConfig = {
        #     Label = "clipse_agent";
        #     KeepAlive = true;
        #     Program = "${pkgs.clipse}/bin/clipse";
        #     ProgramArguments = [
        #       "--listen"
        #     ];
        #   };
        # };
        "syncthing_agent" = {
          serviceConfig = {
            Label = "syncthing_agent";
            KeepAlive = true;
            Program = "${pkgs.syncthing}/bin/syncthing";
            ProgramArguments = [
              "serve"
              "--no-default-folder"
              "--no-browser"
            ];
          };
        };
      };
      networking = {
        hostName = "cube";
        localHostName = "cube";
      };

      homebrew = {
        enable = true;
        taps = [
          # "FelixKratz/formulae" # INFO: for sketchybar
          "ggerganov/ggerganov" # INFO: for hnterm
          "hashicorp/tap" # INFO: for terraform
          # "koekeishiya/formulae" # INFO: for skhd and yabai
          # "mongodb/brew"
          "nikitabobko/tap" # INFO: for aerospace
          "render-oss/render" # INFO: for render
          {
            name = "zen-browser/browser";
            clone_target = "https://github.com/zen-browser/desktop.git";
            force_auto_update = true;
          }
        ];
        brews = [
          "awscli"
          "bat"
          "btop"
          "circumflex"
          "curl"
          "docker"
          "docker-compose"
          "fastfetch"
          # "FelixKratz/formulae/sketchybar"
          "fzf"
          "ggerganov/ggerganov/hnterm" # INFO: Hacker News TUI
          "gh"
          "git-delta"
          "glab"
          "glow"
          "hashicorp/tap/terraform"
          "jnv"
          "jq"
          "lazydocker"
          "lazygit"
          # "koekeishiya/formulae/skhd"
          # "koekeishiya/formulae/yabai"
          # { name = "mongodb/brew/mongodb-community"; start_service = false; }
          # "mpv"
          "neomutt"
          "neovim"
          "pipx"
          "podman"
          "podman-compose"
          "podman-tui"
          "pyenv"
          # "ranger"
          "render-oss/render/render"
          "ripgrep"
          "ruff"
          "saml2aws"
          "siege"
          "stow"
          "syncthing"
          "terminal-notifier"
          "tlrc"
          "tmux"
          "tokei"
          "trash"
          "tree"
          "up"
          "uv"
          "vim"
          "weechat"
          "xclip"
          "yazi"
          "zsh"
        ];
        casks = [
          "alacritty" # TODO: to be replaced with wezterm post 2024/11/30
          "aws-vpn-client"
          "brave-browser"
          "cursor"
          "docker"
          "flameshot" # INFO: Install from nixpkgs since brew does not install the `flameshot` CLI
          "libreoffice"
          "librewolf"
          "logseq"
          # "mongodb-compass"
          "nikitabobko/tap/aerospace"
          "postman"
          "raycast"
          "slack"
          "studio-3t"
          "visual-studio-code"
          "wezterm"
          "zap"
          "zen-browser"
          "zoom"

          # INFO: font related casks
          # "font-sf-pro"
          # "sf-symbols"
        ];
        caskArgs = {
          no_quarantine = true;
        };
      };

      security.pam.enableSudoTouchIdAuth = true;
      # services = {
      #   sketchybar.enable = true;
      #   skhd.enable = true;
      #   yabai.enable = true;
      # };
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
            disable-shadow = true;
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
          # swapLeftCommandAndLeftAlt = true;
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
