{ ... }:

{
  programs.nixvim.plugins = {
    luasnip.enable = true;
    friendly-snippets.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        completion.completeopt = "menu,menuone,noinsert";
        mapping = {
          __raw = ''
            cmp.mapping.preset.insert({
              ['<C-d>'] = cmp.mapping.scroll_docs(-4),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
              ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-y>'] = cmp.mapping.confirm({ select = false }),
              ['<Tab>'] = cmp.mapping(function(fallback)
                if require('luasnip').expand_or_jumpable() then
                  require('luasnip').expand_or_jump()
                else
                  fallback()
                end
              end, { 'i', 's' }),
              ['<S-Tab>'] = cmp.mapping(function(fallback)
                if require('luasnip').jumpable(-1) then
                  require('luasnip').jump(-1)
                else
                  fallback()
                end
              end, { 'i', 's' }),
            })
          '';
        };
        preselect = "cmp.PreselectMode.Item";
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };
    };
  };
}
