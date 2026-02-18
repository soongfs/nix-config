{ pkgs, ... }:

let
  # Language Tools
  langTools = with pkgs; {
    cpp = [ gcc gdb clang-tools ];
    js = [ nodejs ];
    lua = [ lua-language-server ];
    md = [ glow marksman markdownlint-cli prettier ];
    nix = [ nil nixfmt ];
    py = [ python3 uv ty ruff ];
    rs = [ rustup ];
    misc = [ tree-sitter ];
  };
in {
  home.packages = builtins.concatLists (builtins.attrValues langTools);

  # Git
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "soongfs";
        email = "soongfs04@gmail.com";
      };
      init.defaultBranch = "master";
      pull.rebase = true;
    };
  };

  # SSH
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
  };
}
