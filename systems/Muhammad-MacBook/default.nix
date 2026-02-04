{
  inputs,
  outputs,
  lib,
  pkgs,
  ...
}: {
  # Networking DNS & Interfaces
  networking = {
    computerName = "Muhammad-MacBook"; # Define your computer name.
    localHostName = "Muhammad-MacBook"; # Define your local host name.
  };

  # Shriftlar va Ikonkalar uchun
  fonts.packages = with pkgs; [
    # Agar ligaturali va ikonkali SF Mono kerak bo'lsa
    # Bu paket ko'p hollarda Apple shriftlarini o'z ichiga oladi
    pkgs.nerd-fonts.monaspace 
    # Yoki shunchaki ikonkalarni tizim miqyosida yangilab qo'yamiz
    pkgs.nerd-fonts.symbols-only
  ];

  # macOS tizim sozlamalari (iTerm2 va umumiy ko'rinish uchun foydali)
  system.defaults = {
    NSGlobalDomain.AppleFontSmoothing = 1; # Shriftlar juda qalin bo'lmasligi uchun
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  # environment.systemPackages =
  #   [
  #     pkgs.neovim
  #   ];

  # Fingerprint sudo
  # security.pam.services.sudo_local.touchIdAuth = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina

  # Select host type for the system
  nixpkgs.hostPlatform = lib.mkDefault "aarch64-darwin";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
}
