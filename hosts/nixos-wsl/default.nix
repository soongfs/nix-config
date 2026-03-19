{ ... }:

{
  imports = [ ../../modules/nixos/presets/wsl.nix ];

  programs.fish.enable = true;

  system.stateVersion = "25.05";
}
