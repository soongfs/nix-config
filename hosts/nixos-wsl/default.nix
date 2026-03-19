{ username, ... }:

{
  imports = [ ../../modules/nixos/presets/wsl.nix ];

  programs.fish.enable = true;

  home-manager.users.${username}.systemd.user.enable = false;

  system.stateVersion = "25.05";
}
