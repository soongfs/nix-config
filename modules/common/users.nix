{ pkgs, ... }:

{
  programs.zsh.enable = true;
  users.users.soongfs = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };
}
