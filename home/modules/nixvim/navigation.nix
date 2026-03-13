{ ... }:

{
  programs.nixvim = {
    plugins = {
      web-devicons.enable = true;

      "neo-tree".enable = true;

      telescope = {
        enable = true;
        extensions.fzf-native.enable = true;
      };
    };
  };
}
