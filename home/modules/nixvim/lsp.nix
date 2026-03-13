{ ... }:

{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        bashls.enable = true;
        clangd.enable = true;
        cssls.enable = true;
        html.enable = true;
        jsonls.enable = true;
        marksman.enable = true;

        lua_ls = {
          enable = true;
          settings = {
            completion.callSnippet = "Replace";
            diagnostics.globals = [ "vim" ];
            telemetry.enable = false;
            workspace.checkThirdParty = false;
          };
        };

        nil_ls = {
          enable = true;
          settings = {
            formatting.command = [ "nixfmt" ];
            nix.flake = {
              autoArchive = true;
              autoEvalInputs = false;
              nixpkgsInputName = "nixpkgs";
            };
          };
        };

        ruff = {
          enable = true;
          onAttach.function = ''
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
            client.server_capabilities.hoverProvider = false
          '';
          rootMarkers = [
            "pyproject.toml"
            "ruff.toml"
            ".ruff.toml"
            "uv.lock"
            ".git"
          ];
        };

        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
          installRustfmt = false;
          settings = {
            cargo.allFeatures = true;
            check.command = "clippy";
          };
        };

        taplo.enable = true;
        ts_ls.enable = true;

        ty = {
          enable = true;
          rootMarkers = [
            "pyproject.toml"
            "ty.toml"
            "uv.lock"
            ".git"
          ];
        };

        yamlls.enable = true;
      };
    };
  };
}
