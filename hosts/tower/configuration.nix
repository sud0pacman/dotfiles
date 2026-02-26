{
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../keyboards/keyboard.nix
  ];

  networking.hostName = "arava";

  # Set your time zone.
  time.timeZone = "Asia/Tashkent";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8"; # or change to "en_US.UTF-8" or "ru_RU.UTF-8" or "uz_UZ.UTF-8"

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [
    "flakes"
    "nix-command"
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config.common.default = "gnome";
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    aapt
  ];

  services = {
    desktopManager.gnome = {
      enable = true;
    };
    displayManager = {
      gdm.enable = true;
    };

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
        devices = [ "nodev" ];
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
    fastfetch
    gnome-tweaks
    gnome-extension-manager
    ghostty
    home-manager
    chromium
    direnv
    git
    ripgrep
    nixpkgs-fmt
    nixd
    zed-editor
    arp-scan
  ];

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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.zsh.enable = true;
  users.users.muhammad = {
    isNormalUser = true;
    description = "Muhammad";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = "25.11";
}
