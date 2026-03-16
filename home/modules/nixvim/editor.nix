{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        highlight.enable = true;
        indent.enable = true;
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          bash
          c
          cpp
          css
          html
          javascript
          jsdoc
          json
          json5
          lua
          markdown
          markdown_inline
          nix
          python
          query
          regex
          rust
          toml
          tsx
          typescript
          vim
          vimdoc
          yaml
        ];
      };

      "nvim-autopairs".enable = true;

      comment.enable = true;
      "nvim-surround".enable = true;

      "conform-nvim" = {
        enable = true;
        settings = {
          formatters_by_ft = {
            bash = [ "shfmt" ];
            javascript = [ "prettier" ];
            javascriptreact = [ "prettier" ];
            json = [ "prettier" ];
            lua = [ "stylua" ];
            markdown = [ "prettier" ];
            nix = [ "nixfmt" ];
            python = [
              "ruff_fix"
              "ruff_organize_imports"
              "ruff_format"
            ];
            sh = [ "shfmt" ];
            toml = [ "taplo" ];
            typescript = [ "prettier" ];
            typescriptreact = [ "prettier" ];
            yaml = [ "prettier" ];
          };
          format_on_save = {
            lsp_format = "fallback";
            timeout_ms = 750;
          };
        };
      };
    };
  };
}
