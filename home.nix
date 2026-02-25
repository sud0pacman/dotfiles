{ config, pkgs, ... }: {
  home.stateVersion = "25.11";

  home.username = "muhammad";
  home.homeDirectory = "/home/muhammad";

  home.packages = with pkgs; [
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
    android-studio
    scrcpy
    android-tools
    qemu
    # poedit.override { boo}
  ];

  xdg.enable = true;

  # home.activation.linkDesktopApps = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #   mkdir -p "$HOME/.local/share/applications"
  #   for f in $HOME/.nix-profile/share/applications/*.desktop; do
  #     ln -sf "$f" "$HOME/.local/share/applications/$(basename "$f")"
  #   done
  # '';

  programs.home-manager.enable = true;
}
