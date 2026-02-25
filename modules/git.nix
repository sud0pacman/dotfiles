{ config, ... }: {
  programs.git = {
    enable = true;
    lfs.enable = true;

    signing = {
      signByDefault = true;
      key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
      format = "ssh";
    };

    settings = {
      user = {
        name = "sud0pacman";
        email = "mukhammad.kammoliddin@gmail.com";
      };

      init.defaultBranch = "main";

      core = {
        editor = "micro";
        autocrlf = "input";
      };

      commit.gpgsign = true;
      push.autoSetupRemote = true;
    };
  };
}