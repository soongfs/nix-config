{
  homePresetPath,
  username,
  ...
}:

{
  home-manager.users.${username} = {
    imports = [ homePresetPath ];
    programs.home-manager.enable = true;

    home = {
      username = username;
      homeDirectory = "/home/${username}";
      stateVersion = "25.05";
    };
  };
}
