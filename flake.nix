{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      ...
    }@inputs:

    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {

      # nixos - system hostname
      # nixosConfigurations.arava = nixpkgs.lib.nixosSystem {
      #   modules = [
      #     ./configuration.nix

      #     home-manager.nixosModules.home-manager

      #     {

      #       home-manager = {
      #         useGlobalPkgs = true;
      #         # useUserPackages = true;
      #         # backupFileExtension = "backup";

      #         extraSpecialArgs = { inherit inputs; };
      #         users.muhammad = import ./home.nix;
      #       };
      #     }
      #   ];
      #   specialArgs = { inherit inputs; };
      # };

      nixosConfigurations.arava = import ./hosts/tower inputs;

      formatter.${system} = pkgs.nixfmt;
      devShells.${system}.default = import ./shell.nix { inherit self pkgs; };
    };
}
