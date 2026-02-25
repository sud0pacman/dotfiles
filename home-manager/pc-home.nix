{ pkgs, ... }:
{
  home.stateVersion = "25.11";

  imports = [
    ./shared.nix
  ];

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
    authenticator
    libreoffice
    gnome-boxes
    thunderbird
    onlyoffice-desktopeditors
    element-desktop
    gnome-solanum
    icon-library
    calamares-nixos
    gnome-podcasts
    cambalache
    adwsteamgtk
    bustle
    gradia
    cpu-x
    sqlitebrowser
    android-studio
    android-tools
  ];

  programs.home-manager.enable = true;
}
