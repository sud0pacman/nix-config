{pkgs, ...}: {
  # APPS
  environment.systemPackages = with pkgs; [
    # support both 32-bit and 64-bit applications
    wineWowPackages.stable
    samba # Provides ntlm_auth
    krb5 # Provides Kerberos support libraries
    winetricks # Useful for further troubleshooting
    protontricks
    
    gnome-builder
    fractal
    authenticator
    libreoffice
    gnome-boxes
    prismlauncher
    thunderbird
    onlyoffice-desktopeditors
    postman
    # googleearth-pro
    google-chrome
    chromium
    github-desktop
    element-desktop
    telegram-desktop
    discord
    gnome-solanum
    icon-library
    calamares-nixos
    gnome-podcasts
    cambalache
    adwsteamgtk
    bustle
    firefox
    gradia
    cpu-x
    sqlitebrowser
    # poedit.override { boo}
  ];
}
