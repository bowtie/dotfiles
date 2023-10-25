{pkgs, ...}: {
  home = {
    packages = with pkgs; [blackbox-terminal];
  };

  home.file.".local/share/blackbox/schemes/japanesque.json".text = ''
    {
        "name": "Japanesque",
        "comment": "Ported for Terminix Colour Scheme",
        "use-theme-colors": false,
        "foreground-color": "#f7f6ec",
        "background-color": "#1e1e1e",
        "palette": [
          "#343935",
          "#cf3f61",
          "#7bb75b",
          "#e9b32a",
          "#4c9ad4",
          "#a57fc4",
          "#389aad",
          "#fafaf6",
          "#595b59",
          "#d18fa6",
          "#767f2c",
          "#78592f",
          "#135979",
          "#604291",
          "#76bbca",
          "#b2b5ae"
        ]
    }
  '';

  dconf.settings."com/raggesilver/BlackBox" = {
    command-as-login-shell = true;
    custom-shell-command = "${pkgs.fish}/bin/fish";
    use-custom-command = true;
    font = "CaskaydiaCove Nerd Font 12";
    fill-tabs = true;
    show-headerbar = false;
    pretty = true;
    theme-light = "Adwaita";
    theme-dark = "Japanesque";
  };
}
