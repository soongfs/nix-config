/**
  * Host: nixos-tuf-a15
  *
  * Hardware: ASUS TUF Gaming A15
  * CPU: AMD Ryzen 9 7940H (16) @ 3.99 GHz
  * GPU: NVIDIA GeForce RTX 4060 Laptop GPU [Discrete]
  *      AMD Radeon 780M Graphics (417.12 MiB) [Integrated]
  * Memory: 32 GB DDR5 (4800 MT/s)
*/

{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common
    ../../modules/bluetooth.nix
    ../../modules/boot.nix
    ../../modules/fonts.nix
    ../../modules/gnome.nix
    ../../modules/network.nix
    ../../modules/pipewire.nix
    ../../modules/power.nix
    ../../modules/print.nix
    ../../modules/touchpad.nix
    ../../modules/unfree.nix
  ];

  home-manager = {
    users.soongfs = {
      imports = [
        ../../home/cli.nix
        ../../home/dev.nix
        ../../home/gui.nix
      ];
      programs.home-manager.enable = true;
      home.username = "soongfs";
      home.homeDirectory = "/home/soongfs";
      home.stateVersion = "25.05";
    };
  };

  networking.hostName = "nixos";

  system.stateVersion = "25.05";
}
