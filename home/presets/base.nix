{ pkgs, ... }:

{
  imports = [
    ../modules/core.nix
    ../modules/dev.nix
    ../modules/nixvim
  ];

  home.packages = with pkgs; [
    texliveFull
  ];
}
