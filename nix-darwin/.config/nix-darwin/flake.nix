{
  description = "astr0n0mer's nix-darwin config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    macosConfig = import ./macos.nix { pkgs = nixpkgs; };
    configuration = { pkgs, ... }: macosConfig // {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [
          # ansible
          bat
          cargo
          curl
          docker
          docker-compose
          fastfetch
          flameshot
          fzf
          gh
          glab
          glow
          jnv
          jq
          lazydocker
          lazygit
          luajitPackages.luarocks
          # mongodb
          neovim
          # openvpn # INFO: can't set this up to use .ovpn file
          pipx
          pyenv
          ranger
          ripgrep
          slack-term
          stow
          syncthing
          termusic
          tlrc
          tmux
          tree
          ttyper
          typioca
          vim
          visidata
          vscodium
          weechat
          zsh
          zsh-powerlevel10k
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
        packages = with pkgs; [
          nerdfonts
          # sketchybar-app-font
        ];
      };
      launchd.agents = {
        "crontab_agent" = {
          serviceConfig = {
            Label = "crontab";
            Program = "${pkgs.curl}/bin/curl";
            ProgramArguments = [
              "-L"
              "https://afk-slackbot.onrender.com"
            ];
            StartInterval = 720;
          };
        };
        "syncthing_agent" = {
          serviceConfig = {
            Label = "syncthing";
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

      # nixpkgs.config = {
      #   # Set this to true to allow all unfree packages
      #   allowUnfree = true;
      #
      #   # Allow unfree packages only for specific packages
      #   allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
      #     # "mongodb"
      #   ];
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
