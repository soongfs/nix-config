{ pkgs, ... }:

let
  devPackages = with pkgs; [
    gcc
    gdb
    clang-tools
    nodejs
    opencode
    lua-language-server
    glow
    marksman
    markdownlint-cli
    prettier
    nil
    nixfmt
    python3
    uv
    ty
    ruff
    rustup
    tree-sitter
  ];
in
{
  home.packages = devPackages;

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

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
  };
}
