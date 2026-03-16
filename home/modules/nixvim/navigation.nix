{ ... }:

{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "\\";
        action = "<cmd>Neotree reveal<CR>";
        options.silent = true;
      }
    ];

    plugins = {
      web-devicons.enable = true;

      "neo-tree" = {
        enable = true;
        settings = {
          filesystem.window.mappings = {
            "\\" = "close_window";
          };
        };
      };

      telescope = {
        enable = true;
        extensions.fzf-native.enable = true;
      };
    };
  };
}
