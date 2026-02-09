{
  lib,
  config,
  ...
}: let
  apps = lib.mkIf config.homebrew.enable [
    "discord"
    "dbeaver-community"
    "element"
    "font-sf-mono-nerd-font-ligaturized"
    "github"
    "iterm2"
    "keka"
    "kekaexternalhelper"
    "macs-fan-control"
    "sf-symbols"
    "telegram-desktop"
    "visual-studio-code"
    "steam"
  ];
in {
  # Homebrew Casks installations
  homebrew.casks = apps;
}
