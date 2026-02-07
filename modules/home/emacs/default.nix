{ pkgs, config, lib, ... }: # lib ni argument sifatida qo'shdik

let
  emacsPkg = config.programs.emacs.finalPackage;
  inherit (pkgs) stdenv;
  osx = stdenv.hostPlatform.isDarwin;
  emacs =
    if osx
    then pkgs.emacs-macport
    else pkgs.emacs;
in
{
  # 1. Activation skriptini faqat macOS uchun cheklaymiz 
  home.activation = lib.mkIf osx {
    linkEmacsApp = config.lib.dag.entryAfter [ "writeBoundary" ] ''
      app_src="${emacsPkg}/Applications/Emacs.app"
      app_dst="$HOME/Applications/Nix Apps/Emacs.app"
      mkdir -p "$HOME/Applications/Nix Apps"
      rm -rf "$app_dst"
      ${pkgs.mkalias}/bin/mkalias "$app_src" "$app_dst"
    '';
  };

  # 2. Aliasni ham faqat macOS uchun qilamiz (chunki Linuxda 'open' va '.app' yo'q)
  programs.zsh.shellAliases = lib.mkIf osx {
    emacs = "open ${emacsPkg}/Applications/Emacs.app";
  };

  # 3. Emacs dasturi barcha tizimlar uchun
  programs.emacs = {
    enable = true;
    package = emacs;
    extraConfig = builtins.readFile ./init.el;
    extraPackages = epkgs: with epkgs; [
      dashboard
      projectile
      nerd-icons
      envrc
      evil
      evil-collection
      gruvbox-theme
      magit
      meow
    ];
  };
}