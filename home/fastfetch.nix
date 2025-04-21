{ config, pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "file";
        source = "~/.config/fastfetch/bunny.txt";
        color = {
          "1" = "white";
          "2" = "red";
        };
        padding = {
          top = 2;
          left = 2;
          right = 4;
        };
      };
      display = {
        separator = " ";
        color = {
          title = "red";
        };
      };
      modules = [
        "title"
        {
          type = "os";
          key = "OS";
          format = "{2}";
          keyColor = "32";
        }
        {
          type = "kernel";
          key = "Kernel";
          format = "{2}";
          keyColor = "33";
        }
        {
          type = "shell";
          key = "Shell";
          format = "{1}";
          keyColor = "34";
        }
        {
          type = "wm";
          key = "WM";
          # format = "{2}";
          keyColor = "35";
        }
        "break"
        {
            type = "colors";
            symbol = "circle";
        }
        "break"
      ];
    };
  };
}
