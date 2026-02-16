{ ... }:

{
  imports = [ ../../modules/common ];

  home-manager = {
    users.soongfs = {
      imports = [
        ../../home/cli.nix
        ../../home/dev.nix
      ];
      programs.home-manager.enable = true;
      home.username = "soongfs";
      home.homeDirectory = "/home/soongfs";
      home.stateVersion = "25.05";
    };
  };

  networking.hostName = "nixos";

  wsl.enable = true;
  wsl.defaultUser = "soongfs";

  system.stateVersion = "25.05";
}
