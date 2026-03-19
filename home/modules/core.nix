{ lib, pkgs, ... }:

let
  cliPackages = with pkgs; [
    curl
    wget
    fd
    gh
    unzip
    ouch
    man-pages
    man-pages-posix
    fastfetch
    bottom
    ripgrep
  ];
in
{
  home.packages = cliPackages;

  programs.bash = {
    enable = true;
    initExtra = lib.optionalString pkgs.stdenv.isLinux ''
      if [[ $- == *i* ]] && command -v fish >/dev/null 2>&1 && [ -z "$FISH_VERSION" ]; then
        exec fish
      fi
    '';
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
    '';
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = false;
    enableFishIntegration = true;
    enableZshIntegration = false;
    presets = [ "nerd-font-symbols" ];
  };

  programs.zsh = lib.mkIf pkgs.stdenv.isDarwin {
    enable = true;
    initContent = ''
      if [[ -o interactive ]] && command -v fish >/dev/null 2>&1 && [ -z "$FISH_VERSION" ]; then
        exec fish
      fi
    '';
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    icons = "auto";
    colors = "auto";
    git = true;
    extraOptions = [ "--group-directories-first" ];
  };

  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
  };

  programs.lazygit.enable = true;

  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      resurrect
      continuum
      yank
    ];
    terminal = "tmux-256color";
    extraConfig = ''
      set -as terminal-features ',xterm*:RGB'
    '';
  };
}
