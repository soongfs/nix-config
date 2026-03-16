{ ... }:

{
  programs.nixvim = {
    globals.gruvbox_material_enable_italic = true;

    colorschemes.gruvbox-material.enable = true;

    plugins = {
      which-key.enable = true;

      gitsigns.enable = true;

      lualine.enable = true;
    };
  };
}
