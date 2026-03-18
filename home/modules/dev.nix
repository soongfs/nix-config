{ lib, pkgs, ... }:

let
  sharedDevPackages = with pkgs; [
    gcc
    bash-language-server
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
    shfmt
    stylua
    taplo
    texlab
    typescript-language-server
    uv
    ty
    ruff
    rustup
    tree-sitter
    vscode-langservers-extracted
    yaml-language-server
  ];
in
{
  home.packages = sharedDevPackages ++ lib.optionals pkgs.stdenv.isLinux [ pkgs.gdb ];

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
