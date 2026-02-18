{ inputs, pkgs, ... }:

let
  # CLI Utilities
  cliUtils = with pkgs; {
    network = [
      curl
      wget
      gh
    ];
    archive = [
      unzip
      ouch
    ];
    manual = [
      man-pages
      man-pages-posix
    ];
    system = [
      fastfetch
      wl-clipboard
    ];
  };

  # Runtime Libraries
  runtimeLibs = with pkgs; [ glibcLocales ];
in
{
  home.packages = builtins.concatLists (builtins.attrValues cliUtils) ++ runtimeLibs;

  # Shell
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
  };

  # Shell Enhancements
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  home.file.".config/starship.toml".source = "${inputs.dotfiles}/starship/starship.toml";

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "auto";
    colors = "auto";
    git = true;
    extraOptions = [ "--group-directories-first" ];
  };

  # Editor
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  home.file.".config/nvim/init.lua".source = inputs.nvimConfig + "/init.lua";
  home.file.".config/nvim/lua".source = inputs.nvimConfig + "/lua";

  # File Manager
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
  };

  # Git UI
  programs.lazygit.enable = true;
}
