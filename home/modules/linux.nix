{ pkgs, ... }:

{
  home.packages = with pkgs; [
    glibcLocales
    wl-clipboard
  ];
}
