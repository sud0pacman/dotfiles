{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "arava";

  # programs.nix-data = {
  #   enable = true;
  #   systemconfig = "/home/muhammad/workplace/sud0pacman/confs/modules/nixos/apps/default.nix";
  #   flake = "/home/muhammad/workplace/sud0pacman/nix-config/flake.nix";
  #   flakearg = "arava";
  # };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs;
    [
      aapt
    ];


  services = {
    samba = {
      enable = true;
      package = pkgs.samba4Full;
      openFirewall = true;

      settings = {
        global = {
          "server smb encrypt" = "required";
          "server min protocol" = "SMB3_00";
          "workgroup" = "WORKGROUP";
          "security" = "user";
        };

        testshare = {
          "path" = "/home/muhammad/Public";
          "writable" = "yes";
          "comment" = "Hello World!";
          "browseable" = "yes";
        };
        # fayllar = {
        #   "path" = "/media/fayllar";
        #   "writable" = "yes";
        #   "comment" = "Hello World!";
        #   "browseable" = "yes";
        # };
      };
    };
    samba-wsdd = {
      enable = true;
      openFirewall = true;
    };
    avahi = {
      enable = true;
      publish.enable = true;
      publish.userServices = true;
      openFirewall = true;
    };
  };

  programs.adb.enable = true;

  # remove all gnome utility apps
  # services.gnome.core-utilities.enable = false;

  # Select host type for the system
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = "25.11";
}