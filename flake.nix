{
  description = "Modular System Configuration"

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux"; #if not working: see nix starter config
    in {
      nixosConfigurations = {
        nixpc = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs outputs;}; #necessary?
          modules = [ ./hosts/nixpc/configuration.nix ];
        };

        nixserver = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs outputs;}; #necessary?
          modules = [ ./hosts/nixserver/configuration.nix ];
        };
      };

      homeConfigurations = {
        "mael@nixpc" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = {inherit inputs outputs;}; #necessary?
          modules = [ ./hosts/nixpc/home.nix ];
        };

        "mael@nixserver" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = {inherit inputs outputs;}; #necessary?
          modules = [ ./hosts/nixserver/home.nix ];
        };
      };
    };
}
