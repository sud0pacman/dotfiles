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

  # Set your time zone.
  time.timeZone = "Asia/Tashkent";

  # programs.nix-data = {
  #   enable = true;
  #   systemconfig = "/home/muhammad/workplace/sud0pacman/confs/modules/nixos/apps/default.nix";
  #   flake = "/home/muhammad/workplace/sud0pacman/nix-config/flake.nix";
  #   flakearg = "arava";
  # };

  nix.settings.experimental-features = [
    "flakes" 
    "nix-command"
  ];

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
  
  # Boot loader
  boot = {
    loader = {
      # After going back to bootloader, run this: 
      # nixos-rebuild switch --install-bootloader
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        devices = ["nodev"];
        useOSProber = true;
        efiSupport = true;
        theme = "${
          (pkgs.fetchFromGitHub {
            owner = "xinux-org";
            repo = "bootloader-theme";
            tag = "v1.0.3";
            hash = "sha256-ipaiJiQ3r2B3si1pFKdp/qykcpaGV+EqXRwl6UkCohs=";
          })
        }/xinux";
      };
    };
    # plymouth = {
    #   enable = true;
    #   theme = "mac-style";
    #   themePackages = [inputs.mac-style-plymouth.packages."${pkgs.stdenv.hostPlatform.system}".default];
    # };
    consoleLogLevel = 3;
    initrd.systemd.enable = true;
    initrd.verbose = false;
  };

  # System Packages
  environment.systemPackages = with pkgs; [
    neovim
    fastfetch
    gnome-tweaks
    gnome-extension-manager
    ghostty
    home-manager
    #git
    #rustup
    #gcc
    # gnome-builder
    # flatpak
    # flatpak-builder
  ];

  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us,ru";
        options = "caps:escape,grp:alt_shift_toggle";
        variant = "altgr-intl,,";
      };

      # videoDrivers = ["nvidia"];
    };
    desktopManager.gnome = {
      enable = true;
    };
    displayManager = {
      gdm.enable = true;
    };
  };

  # gnome packages setup
  environment.gnome.excludePackages = with pkgs; [
    gnome-photos
    gnome-tour
    gedit
    cheese
    gnome-music
    epiphany
    geary
    evince
    totem
    tali
    iagno
    hitori
    atomix
    seahorse
  ];

  # Select host type for the system
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = "25.11";
}