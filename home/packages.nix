{pkgs, ...}: {
  # hide entries
  xdg.desktopEntries = {
    "ranger" = {
      name = "ranger";
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
    github-desktop
    # bottles
    icon-library
    vscodium
    keepassxc
    signal-desktop
    dconf-editor

    # tools
    bat
    eza
    ranger
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
    bun
    sassc
    typescript
    meson
    ninja
    eslint
  ];
}
