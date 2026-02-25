{
  nixpkgs,
  home-manager,
  ...
}@inputs:
let
  system = "x86_64-linux";
in
nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = { inherit inputs; };

  modules = [
    ./configuration.nix

    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        # useUserPackages = true;
        # backupFileExtension = "backup";

        extraSpecialArgs = { inherit inputs system; };
        users.muhammad = import ../../home-manager/pc-home.nix;
      };
    }
  ];
}
