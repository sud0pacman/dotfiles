{
  self,
  pkgs,
  ...
}:
pkgs.mkShell {
  packages = with pkgs; [
    self.formatter.${system}

    nixd
    statix
    deadnix
    nixfmt-tree
  ];
}
