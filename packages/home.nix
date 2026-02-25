{ inputs, pkgs, ... } : let system = pkgs.system; in {
  home.packages = with pkgs; [
    zip

    # productivity
    btop
    github-desktop
    scrcpy

    telegram-desktop
    fractal
    
    google-chrome
    chromium
    firefox
  ];
}