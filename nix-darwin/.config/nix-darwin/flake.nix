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
          # ansible
          # calcure # INFO: calendar TUI
          cargo # INFO: rust package manager
          # clipse # INFO: clipboard manager TUI
          # delta
          # direnv
          # docker
          # docker-client
          # docker-compose
          # firebase-tools
          # flameshot # INFO: screenshot tool
          # lazysql
          luajitPackages.luarocks # INFO: lua package manager
          # man-pages-posix
          # openvpn # INFO: can't set this up to use .ovpn file
          # slack-term
          syncthing # INFO: file sync on local network
          # termusic
          # terraform # INFO: infrastructure as code
          ttyper # INFO: typing practice
          # visidata # INFO: spreadsheet TUI
          # vscodium # INFO: vscode without telemetry
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
        # "crontab_agent" = {
        #   serviceConfig = {
        #     Label = "crontab_afk_slackbot";
        #     Program = "${pkgs.curl}/bin/curl";
        #     ProgramArguments = [
        #       "--location"
        #       "https://afk-slackbot.onrender.com"
        #     ];
        #     StartInterval = 720;
        #   };
        # };
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
          "bloznelis/tap"
          # "FelixKratz/formulae"
          "ggerganov/ggerganov"
          "hashicorp/tap"
          # "koekeishiya/formulae"
          # "mongodb/brew"
          "nikitabobko/tap"
          "render-oss/render"
        ];
        brews = [
          "act" # INFO: GitHub Actions CLI
          "awscli"
          "bat" # INFO: cat clone with wings
          "bloznelis/tap/typioca" # INFO: typing practice
          "borgbackup" # INFO: deduplicating archiver with compression and authenticated encryption
          "btop"
          # "circumflex" # INFO: Hacker News TUI
          "curl"
          # "deno"
          # "docker" # TODO: confirm if install the `docker` cask automatically installs this
          "docker-compose"
          "exercism"
          "fastfetch" # INFO: neofetch successor
          # "FelixKratz/formulae/sketchybar"
          "ffmpeg"
          "fzf" # INFO: fuzzy finder
          "ggerganov/ggerganov/hnterm" # INFO: Hacker News TUI
          "gh" # INFO: GitHub CLI
          "git-delta"
          "glab" # INFO: GitLab CLI
          "glow" # INFO: markdown reader
          "gnu-typist" # INFO: gtypist: typing practice
          "gpg-tui"
          "hashicorp/tap/terraform"
          "img2pdf"
          "jnv" # INFO: interactive json viewer with `jq` syntax
          "jq" # INFO: json processor
          # "koekeishiya/formulae/skhd" # replaced by karabiner-elements
          # "koekeishiya/formulae/yabai" # replaced by aerospace
          "lazydocker" # INFO: docker TUI
          "lazygit" # INFO: git TUI
          "llvm"
          # { name = "mongodb/brew/mongodb-community"; start_service = false; }
          "mpv" # INFO: media player
          "neomutt" # INFO: email client TUI
            "abook" # INFO: address book
            "ca-certificates"
            "isync"
            "lynx" # INFO: text-based browser
            "msmtp" # INFO: SMTP client
            "notmuch" # INFO: email indexer
            "pass" # INFO: password manager
            "urlview"
          "neovim" # INFO: vim successor
          # "nvm" # INFO: node version manager # installing `nvm` this way is discouraged
          "ocrmypdf" # INFO: adds an OCR text layer to scanned PDF files
          "ollama"
          "pipx" # INFO: python package manager
          "podman" # INFO: container runtime
          "podman-compose"
          "podman-tui"
          "posting" # INFO: API client TUI
          "pyenv" # INFO: python version manager
          # "ranger" # INFO: file manager TUI # replaced by yazi
          "render-oss/render/render"
          "ripgrep" # INFO: faster grep
          "ruff" # INFO: python formatter, linter
          "saml2aws"
          "siege"
          "stow" # INFO: symlink manager
          "terminal-notifier"
          "tesseract" # INFO: OCR (Optical Character Recognition) engine
          "tlrc" # INFO: tldr of CLI commands
          "tmux" # INFO: terminal multiplexer
          "tokei" # INFO: code statistics
          "trash"
          "tree" # INFO: directory tree viewer
          "up" # INFO: ultimate plumber
          "uv" # INFO: python
          "vim" # INFO: text editor
          "weechat" # INFO: IRC client
          "xclip" # INFO: clipboard manager
          "yazi" # INFO: file manager TUI
          "zsh" # INFO: shell
          "zsh-autocomplete"
          "zsh-autosuggestions"
        ];
        casks = [
          # "alacritty" # replaced by wezterm
          "aws-vpn-client"
          # "bitwarden" # INFO: couldn't set up autofill on macOS
          "brave-browser"
          "cursor" # INFO: vscode fork with AI integration (proprietary)
          "docker"
          # "ferdium"
          "flameshot" # INFO: Install from nixpkgs since brew does not install the `flameshot` CLI
          "ghostty" # INFO: terminal emulator
          "gimp" # INFO: GNU Image Manipulation Program
          "hoppscotch" # INFO: API client
          "karabiner-elements"
          "libreoffice" # INFO: office suite
          "librewolf" # INFO: privacy focused browser
          "logseq" # INFO: note-taking app
          # "mongodb-compass"
          "nikitabobko/tap/aerospace" # INFO: tiling window manager
          "postman" # INFO: API client
          # "raycast" # INFO: spotlight alternative (proprietary)
          "slack"
          "stats" # INFO: system monitor
          "studio-3t"
          # "ueli" # INFO: spotlight alternative
          "visual-studio-code"
          "wezterm" # INFO: terminal emulator
          "windsurf" # INFO: vscode fork with AI integration
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
      #   aerospace.enable = true;
      #   karabiner-elements.enable = true;
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
          controlcenter = {
            BatteryShowPercentage = true;
          };
          CustomUserPreferences = {
            universalaccess = { # INFO: this might be ineffective
              useVirtualKeyboard = true;
            };
          };
          dock = {
            autohide = true;
            expose-animation-duration = 0.05;
            expose-group-apps = true;
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
            FXRemoveOldTrashItems = true;
            ShowPathbar = true;
            _FXShowPosixPathInTitle = true;
          };
          LaunchServices = {
            LSQuarantine = false;
          };
          menuExtraClock = {
            ShowAMPM = false;
            ShowDayOfWeek = false;
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
          # INFO: need to provide "Full Disk Access" to the terminal emulator
          # INFO: `open "x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles"`
          # universalaccess = {
          #   reduceMotion = true;
          # };
        };
        keyboard = {
          # INFO: I use kanata for key-remapping on Linux
          enableKeyMapping = true;
          # remapCapsLockToControl = true;
          swapLeftCommandAndLeftAlt = true;
          swapLeftCtrlAndFn = true;
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
