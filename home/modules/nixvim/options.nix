{ ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    opts = {
      autoindent = true;
      cursorline = true;
      expandtab = true;
      mouse = "a";
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      signcolumn = "yes";
      smartindent = true;
      softtabstop = 2;
      splitbelow = true;
      splitright = true;
      tabstop = 2;
      termguicolors = true;
      timeoutlen = 300;
      updatetime = 250;
    };

    diagnostic.settings = {
      severity_sort = true;
      underline = true;
      update_in_insert = false;
      virtual_text = {
        source = "if_many";
        spacing = 2;
      };
      float = {
        border = "rounded";
        source = "if_many";
      };
    };
  };
}
