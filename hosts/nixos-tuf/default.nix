# Host: nixos-tuf-a15
# Hardware: ASUS TUF Gaming A15
# CPU: AMD Ryzen 9 7940H
# GPU: NVIDIA RTX 4060 Laptop + AMD Radeon 780M

{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/presets/desktop.nix
  ];

  system.stateVersion = "25.05";
}
