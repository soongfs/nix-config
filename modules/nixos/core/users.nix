{
  pkgs,
  username,
  ...
}:

{
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "render"
    ];
    shell = pkgs.bashInteractive;
  };
}
