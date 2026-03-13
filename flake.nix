{
  description = "Unified Nix configuration for NixOS hosts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl.url = "github:nix-community/NixOS-WSL";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      nixos-wsl,
      ...
    }:
    let
      lib = nixpkgs.lib;
      defaultSystem = "x86_64-linux";
      username = "soongfs";

      mkNixosHost =
        {
          name,
          system ? defaultSystem,
          homePreset ? "base",
          extraModules ? [ ],
        }:
        lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs username;
            homePresetPath = ./home/presets + "/${homePreset}.nix";
          };
          modules =
            [
              ./modules/shared
              ./modules/nixos/core
              home-manager.nixosModules.home-manager
              {
                networking.hostName = name;

                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = {
                    inherit inputs username;
                  };
                };
              }
            ]
            ++ extraModules;
        };
    in
    {
      nixosConfigurations = {
        nixos-tuf = mkNixosHost {
          name = "nixos-tuf";
          homePreset = "desktop";
          extraModules = [ ./hosts/nixos-tuf ];
        };

        nixos-wsl = mkNixosHost {
          name = "nixos-wsl";
          homePreset = "base";
          extraModules = [
            nixos-wsl.nixosModules.wsl
            ./hosts/nixos-wsl
          ];
        };
      };
    };
}
