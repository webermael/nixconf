{
  description = "Modular System Configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyrpland.url = "github:hyprwm/Hyprland";

    # AGS Widgets
    ags.url = "github:Aylur/ags";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux"; #if not working: see nix starter config
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/laptop/configuration.nix
            ./modules/nixos
          ];
        };

        server = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/server/configuration.nix
            ./modules/nixos
          ];
        };
      };

      homeConfigurations = {
        "mael@laptop" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/laptop/home.nix
            ./modules/home-manager
          ];
        };

        "mael@server" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/server/home.nix
            ./modules/home-manager
          ];
        };
      };
    };
}
