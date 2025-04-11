{ config, pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    package = pkgs.emptyDirectory;
    settings = {
      theme = "shibuya";
      font-size = 13;
      font-family = "Geist Mono";
      window-padding-y = 15;
      window-padding-x = 15;
    };
    themes = {
      shibuya = {
        background = "16161e";
        cursor-color = "c0caf5";
        foreground = "c7ccd4";
        palette = [
          "0=#363b54"
          "1=#f7768e"
          "2=#41a6b5"
          "3=#e0af68"
          "4=#7aa2f7"
          "5=#bb9af7"
          "6=#7dcfff"
          "7=#787c99"
          "8=#363b54"
          "9=#f7768e"
          "10=#41a6b5"
          "11=#e0af68"
          "12=#7aa2f7"
          "13=#bb9af7"
          "14=#7dcfff"
          "15=#acb0d0"
        ];
        selection-background = "211e29";
        selection-foreground = "dee1d6";
      };
    };
  };
}
