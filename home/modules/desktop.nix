{ inputs, pkgs, ... }:

{
  imports = [ inputs.dms.homeModules.dank-material-shell ];

  home.packages = with pkgs; [ ghostty ];

  programs.dank-material-shell = {
    enable = true;
    systemd.enable = true;
    quickshell.package = pkgs.quickshell;
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      qt6Packages.fcitx5-chinese-addons
      fcitx5-gtk
      libsForQt5.fcitx5-qt
    ];
  };

  programs.firefox.enable = true;

  xdg.mimeApps.defaultApplications = {
    "text/html" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
  };

  programs.thunderbird = {
    enable = true;
    profiles = { };
  };
}
