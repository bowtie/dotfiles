{
  inputs,
  pkgs,
  username,
  ...
}: {
  imports = [
    ./disk.nix
    ./hardware.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  services.btrfs.autoScrub.enable = true;

  programs = {
    dconf.enable = true;
    fish.enable = true;
  };

  environment.systemPackages = with pkgs; [
    home-manager
    git

    # System utilities
    btop            # System monitor
    curl
    unzip
    zip
    rsync

    # Modern CLI replacements
    bat             # Better cat
    eza             # Modern ls replacement
    zoxide          # Smarter cd command
    fzf             # Fuzzy finder
    ripgrep         # Better grep
    fd              # Better find

    # File managers
    nnn             # Lightweight file manager
  ];

  # Wayland + Hyprland fixes
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.QT_SCALE_FACTOR = "1.25";

  services = {
    xserver = {
      enable = true;
      excludePackages = [pkgs.xterm];
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      xkb.layout = "pt";
    };
    flatpak.enable = true;
  };

  # zram configuration instead of swapfile
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;  # Adjust as needed
  };

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "video"
    ];
  };

  networking = {
    hostName = "yuki";
    networkmanager.enable = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}
