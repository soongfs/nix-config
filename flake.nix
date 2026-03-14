{
  description = "Unified Nix configuration for NixOS and Darwin hosts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    "nix-darwin" = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl.url = "github:nix-community/NixOS-WSL";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      nixvim,
      nixos-wsl,
      ...
    }:
    let
      lib = nixpkgs.lib;
      defaultLinuxSystem = "x86_64-linux";
      defaultDarwinSystem = "aarch64-darwin";
      username = "soongfs";

      mkNixosHost =
        {
          name,
          system ? defaultLinuxSystem,
          homePreset ? "linux-base",
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

      mkDarwinHost =
        {
          name,
          system ? defaultDarwinSystem,
          homePreset ? "base",
          extraModules ? [ ],
        }:
        inputs."nix-darwin".lib.darwinSystem {
          inherit system;
          specialArgs = {
            inherit inputs username;
            hostName = name;
            homePresetPath = ./home/presets + "/${homePreset}.nix";
          };
          modules =
            [
              ./modules/shared
              ./modules/darwin/core
              home-manager.darwinModules.home-manager
              {
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
          homePreset = "linux-base";
          extraModules = [
            nixos-wsl.nixosModules.wsl
            ./hosts/nixos-wsl
          ];
        };
      };

      darwinConfigurations = {
        "Soongs-Mac-mini" = mkDarwinHost {
          name = "Soongs-Mac-mini";
          homePreset = "base";
          extraModules = [ ./hosts/soongs-mac-mini ];
        };
      };
    };
}
