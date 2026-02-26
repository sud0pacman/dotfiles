{ ... }: {
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    installVimSyntax = true;
    settings = {
      font-family = "Iosevka";
      # font-family = "SF Mono";

      gtk-titlebar = false;

      keybind = [
        # Switching in-tab splits
        "alt+h=goto_split:left"
        "alt+l=goto_split:right"
        "alt+j=goto_split:down"
        "alt+k=goto_split:up"

        # Splitting tabs
        "super+h=new_split:left"
        "super+l=new_split:right"
        "super+j=new_split:down"
        "super+k=new_split:up"

        # Switching tabs
        "shift+alt+j=previous_tab"
        "shift+alt+k=next_tab"

        # New tab
        "alt+t=new_tab"

        # Remove the huge window panel on top
        "alt+g=toggle_window_decorations"
      ];
    };
  };
}