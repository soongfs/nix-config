{ pkgs, ... }:

{
  programs.zsh.enable = true;
  users.users.soongfs = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "render" ];
    shell = pkgs.zsh;
  };
}
