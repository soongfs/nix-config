{
  pkgs,
  username,
  ...
}:

{
  programs.bash.enable = true;
  programs.zsh.enable = true;

  users.users.${username} = {
    home = "/Users/${username}";
    shell = pkgs.zsh;
  };
}
