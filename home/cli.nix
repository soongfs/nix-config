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

  xdg.configFile."nvim".source = inputs.nvim-config;

  # File Manager
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
  };

  # Git UI
  programs.lazygit.enable = true;
}
