{ ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    extraConfigLua = ''
      if vim.fn.has("wsl") == 1 then
        vim.g.clipboard = {
          name = "WslClipboard",
          copy = {
            ["+"] = "clip.exe",
            ["*"] = "clip.exe",
          },
          paste = {
            ["+"] = 'powershell.exe -NoLogo -NoProfile -Command [Console]::Out.Write($(Get-Clipboard -Raw).ToString().Replace("`r", ""))',
            ["*"] = 'powershell.exe -NoLogo -NoProfile -Command [Console]::Out.Write($(Get-Clipboard -Raw).ToString().Replace("`r", ""))',
          },
          cache_enabled = 0,
        }
      end
    '';

    autoCmd = [
      {
        event = [ "FileType" ];
        pattern = [
          "c"
          "cpp"
          "objc"
          "objcpp"
        ];
        command = "setlocal cindent";
        desc = "Use C indentation for C-family files";
      }
    ];

    opts = {
      autoindent = true;
      clipboard = "unnamedplus";
      cursorline = true;
      expandtab = true;
      mouse = "a";
      number = true;
      relativenumber = true;
      shiftwidth = 4;
      signcolumn = "yes";
      smartindent = true;
      softtabstop = 4;
      splitbelow = true;
      splitright = true;
      tabstop = 4;
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
