{ inputs, lib, pkgs, ... }:

let
  quickshellWaylandOnly = pkgs.quickshell.overrideAttrs (old: {
    buildInputs = lib.filter (pkg: lib.getName pkg != "libxcb") (old.buildInputs or [ ]);
    cmakeFlags =
      (old.cmakeFlags or [ ])
      ++ [
        (lib.cmakeBool "X11" false)
        (lib.cmakeBool "I3" false)
        (lib.cmakeBool "I3_IPC" false)
      ];
  });
in
{
  imports = [ inputs.dms.homeModules.dank-material-shell ];

  home.packages = with pkgs; [ ghostty ];

  programs.dank-material-shell = {
    enable = true;
    systemd.enable = true;
    quickshell.package = quickshellWaylandOnly;
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
