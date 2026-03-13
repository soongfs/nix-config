{ pkgs, ... }:

let
  cliPackages = with pkgs; [
    curl
    wget
    gh
    unzip
    ouch
    man-pages
    man-pages-posix
    fastfetch
    wl-clipboard
    glibcLocales
  ];
in
{
  home.packages = cliPackages;

  programs.bash = {
    enable = true;
    initExtra = ''
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
  programs.tmux.enable = true;
}
