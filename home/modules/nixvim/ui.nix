{ ... }:

{
  programs.nixvim = {
    colorschemes.gruvbox-material.enable = true;

    plugins = {
      which-key.enable = true;

      gitsigns.enable = true;

      lualine.enable = true;
    };
  };
}
