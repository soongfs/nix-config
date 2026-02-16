{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      sarasa-gothic
      maple-mono.NF-CN
      noto-fonts-color-emoji
    ];

    fontconfig = {
      enable = true;

      defaultFonts = {
        sansSerif = [
          "Sarasa Gothic SC"
          "Sarasa Gothic TC"
          "Sarasa Gothic J"
          "Sarasa Gothic K"
        ];
        serif = [
          "Sarasa Gothic Slab SC"
          "Sarasa Gothic Slab TC"
          "Sarasa Gothic Slab J"
          "Sarasa Gothic Slab K"
        ];
        monospace = [ "Maple Mono NF CN" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
