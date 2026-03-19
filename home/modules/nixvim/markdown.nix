{ ... }:

{
  programs.nixvim = {
    autoCmd = [
      {
        event = [ "FileType" ];
        pattern = [ "markdown" ];
        command = "setlocal wrap linebreak breakindent spell";
        desc = "Improve Markdown editing ergonomics";
      }
    ];

    plugins = {
      "render-markdown" = {
        enable = true;
        autoLoad = true;
        settings = {
          debounce = 75;
          completions.lsp.enabled = true;
          overrides.filetype.markdown = {
            sign.enabled = false;
            heading.border = true;
            code.border = "thin";
          };
        };
      };
    };
  };
}
