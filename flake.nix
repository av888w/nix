{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      system = "x86_64-linux";
      host = "rift";
    in {
      nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
        modules = [ ./configuration.nix ];
        inherit system;
      };

      homeConfigurations.${host} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./modules/home
        ];
      };
    };
}