{
  pkgs,
  username,
  ...
}: {
  imports = [
    ./disk.nix
    ./gnome.nix
    ./hardware.nix
    ./hyprland.nix
  ];

  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
  };

  fonts.packages = with pkgs; [
    adwaita-fonts
    inter
    geist-font
    (callPackage ../../packages/fonts/figtree.nix {})
  ];

  hyprland.enable = true;
  gnome.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_zen;
  services.btrfs.autoScrub.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      allow-dirty = true;
      warn-dirty = false; # No dirty Git tree reminders on rebuild
      auto-optimise-store = true;
      substituters = [
        # high priority since it's almost always used
        "https://cache.nixos.org?priority=10"
        "https://fufexan.cachix.org"
        "https://hyprland.cachix.org"
        "https://nix-community.cachix.org"
        "https://nix-gaming.cachix.org"
        "https://ezkea.cachix.org"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "fufexan.cachix.org-1:LwCDjCJNJQf5XD2BV+yamQIMZfcKWR9ISIFy5curUsY="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  programs = {
    dconf.enable = true;
    fish.enable = true;
    firefox.enable = true;
    nix-ld.enable = true;
  };

  environment.systemPackages = with pkgs; [
    home-manager
    micro
    git

    # System utilities
    btop
    curl
    unzip
    zip
    rsync

    # Modern CLI replacements
    bat
    eza
    zoxide
    fzf
    ripgrep
    fd

    # File manager
    yazi

    # Apps
    figma-linux
  ];

  # Wayland + Hyprland fixes
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.QT_SCALE_FACTOR = "1.25";

  services = {
    xserver = {
      enable = true;
      excludePackages = [pkgs.xterm];
      xkb.layout = "pt";
    };
    flatpak.enable = true;
  };

  # zram configuration instead of swapfile
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.fish;
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
