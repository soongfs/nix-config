{
  pkgs,
  username,
  ...
}:

{
  programs.bash.enable = true;

  users.users.${username} = {
    home = "/Users/${username}";
    shell = pkgs.bashInteractive;
  };
}
