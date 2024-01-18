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
    d-spy
    easyeffects
    vesktop
    icon-library
    vscodium
    bitwarden
    signal-desktop
    dconf-editor
    meld

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
    openssl

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
    glow
    slides
    skate
    yabridge
    yabridgectl
    wine-staging
    distrobox

    # langs
    nodejs
    cargo
    bun
    go
    gcc
    typescript
    eslint
  ];
}
