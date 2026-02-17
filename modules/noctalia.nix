{ inputs, pkgs, ... }:

{
  environment.systemPackages =
    [ inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default ];

  imports = [ inputs.noctalia.nixosModules.default ];

  services.noctalia-shell.enable = true;
}
