{ pkgs, ... }:
{
  config = {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode;
      mutableExtensionsDir = true;

      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          # --- Core & UI ---
          jdinhlife.gruvbox
          pkief.material-icon-theme
          pkief.material-product-icons
          zhuangtongfa.material-theme # Yangi: Material Theme
          usernamehw.errorlens
          eamodio.gitlens
          esbenp.prettier-vscode
          oderwat.indent-rainbow

          # --- Nix ---
          jnoortheen.nix-ide
          # Nix formatter uchun nixpkgs dan alejandra-ni ham qo'shishni unutmang

          # --- Rust ---w
          rust-lang.rust-analyzer
          tamasfe.even-better-toml

          # --- Flutter & Dart ---
          dart-code.dart-code
          dart-code.flutter

          #optional
          wakatime.vscode-wakatime
        ];

        userSettings = {
          # --- General Settings ---
          "workbench.colorTheme" = "Community Material Theme Darker"; # Shu yerni o'zgartiring
          "workbench.iconTheme" = "material-icon-theme";
          "editor.tabSize" = 2;
          "editor.fontFamily" = "'Iosevka', 'JetBrainsMono Nerd Font', 'FiraCode Nerd Font', monospace";
          "files.autoSave" = "afterDelay";
          "update.mode" = "none";
          "telemetry.telemetryLevel" = "off";
          "editor.fontSize" = 14;

          # --- Nix Settings ---
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nixd"; # yoki nil
          "nix.formatterPath" = "alejandra";
          # Muhim: Ba'zida nix-ide nix-instantiate-ni topa olmaydi
          "nix.packagePath" = "${pkgs.nix}/bin/nix";

          "nix.serverSettings" = {
            "nixd" = {
              "formatting" = {
                "command" = [ "alejandra" ];
              };
            };
          };
          "[nix]" = {
            "editor.defaultFormatter" = "jnoortheen.nix-ide";
            "editor.formatOnSave" = true;
          };

          # --- Rust Settings ---
          "rust-analyzer.completion.callable.snippets" = "fill_arguments";
          "rust-analyzer.checkOnSave.command" = "clippy";
          "[rust]" = {
            "editor.defaultFormatter" = "rust-lang.rust-analyzer";
            "editor.formatOnSave" = true;
          };

          # --- Flutter/Dart Settings ---
          "dart.openDevTools" = "flutter";
          "dart.debugExternalPackageLibraries" = false;
          "dart.debugSdkLibraries" = false;
          "dart.lineLength" = 120;
          "[dart]" = {
            "editor.formatOnSave" = true;
            "editor.formatOnType" = true;
            "editor.selectionHighlight" = false;
            "editor.suggest.snippetsPreventQuickSuggestions" = false;
            "editor.extractMethodOnType" = true;
          };

          # --- Clean up UI ---
          "chat.agent.enabled" = false;
          "terminal.integrated.initialHint" = false;
        };
      };
    };
  };
}
