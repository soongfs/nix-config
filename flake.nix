{
  description = "My Nix configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl.url = "github:nix-community/NixOS-WSL";

    nvim-config = {
      url = "github:soongfs/kickstart.nvim";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, nixos-wsl, ... }@inputs:
    let
      system = "x86_64-linux";
      mkHost = extraModules:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = extraModules ++ [
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
            }
          ];
        };
    in {
      nixosConfigurations = {
        nixos-tuf = mkHost [ ./hosts/nixos-tuf ];
        nixos-wsl = mkHost [ nixos-wsl.nixosModules.wsl ./hosts/nixos-wsl ];
      };
    };
}
