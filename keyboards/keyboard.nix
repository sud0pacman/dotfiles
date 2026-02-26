{ ... }:
{
  services.xserver = {
    enable = true;

    # Configure keymap in X11
    xkb = {
      options = "caps:escape,grp:alt_shift_toggle";
      extraLayouts.uz = {
        description = "Uzbek (Oʻzbekiston)";
        languages = [
          "en"
          "uz"
        ];
        symbolsFile = ./uz;
      };
      layout = "uz,us";
      variant = "latin";
    };
  };
}
