{pkgs, ...}: {
  xdg.desktopEntries = {
    "lf" = {
      name = "lf";
      noDisplay = true;
    };
  };

  home.packages = with pkgs;
  with nodePackages_latest;
  with gnome; [
    # colorscript
    (import ./colorscript.nix {inherit pkgs;})

    # gui
    (mpv.override {scripts = [mpvScripts.mpris];})
    # spotify
    d-spy
    easyeffects
    # discord
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    github-desktop
    # bottles
    icon-library
    vscodium
    keepassxc
    signal-desktop
    dconf-editor
    # lutris

    # tools
    adguardian
    alejandra
    bat
    eza
    fd
    ripgrep
    fzf
    socat
    jq
    acpi
    inotify-tools
    ffmpeg
    libnotify
    killall
    zip
    unzip
    glib

    # hyprland
    wl-gammactl
    wl-clipboard
    wf-recorder
    hyprpicker
    wayshot
    swappy
    slurp
    imagemagick
    pavucontrol
    brightnessctl
    swww

    # fun
    fortune
    jp2a
    pywal
    glow
    vhs
    gum
    slides
    charm
    skate
    yabridge
    yabridgectl
    wine-staging
    # distrobox

    # langs
    nodejs
    go
    gcc
    typescript
    eslint
  ];
}
