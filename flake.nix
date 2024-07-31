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
        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs outputs;}; #necessary?
          modules = [ ./hosts/laptop/configuration.nix ];
        };

        server = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs outputs;}; #necessary?
          modules = [ ./hosts/server/configuration.nix ];
        };
      };

      homeConfigurations = {
        "mael@laptop" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = {inherit inputs outputs;}; #necessary?
          modules = [ ./hosts/laptop/home.nix ];
        };

        "mael@server" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = {inherit inputs outputs;}; #necessary?
          modules = [ ./hosts/server/home.nix ];
        };
      };
    };
}
