{ ... }:

{
  imports = [
    ./base.nix
    ../modules/darwin/containers.nix
    ../modules/darwin/forgejo.nix
  ];
}
