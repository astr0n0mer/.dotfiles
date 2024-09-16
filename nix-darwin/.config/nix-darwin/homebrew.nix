{ pkgs, ... }:

{
  enable = true;
  taps = [
    "FelixKratz/formulae"
    "ggerganov/ggerganov"
    "koekeishiya/formulae"
    "ngrok/ngrok"
    "nikitabobko/tap"
    "render-oss/render"
    {
      name = "zen-browser/browser";
      clone_target = "https://github.com/zen-browser/desktop.git";
      force_auto_update = true;
    }
  ];
  brews = [
    # "FelixKratz/formulae/sketchybar"
    "ggerganov/ggerganov/hnterm"
    # "koekeishiya/formulae/skhd"
    # "koekeishiya/formulae/yabai"
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
    "libreoffice"
    "logseq"
    "mongodb-compass"
    "ngrok"
    "nikitabobko/tap/aerospace"
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
}
