{pkgs}: {
  services = {
    xserver = {
      enable = true;
      excludePackages = [pkgs.xterm];
      xkb.layout = "pt";
    };
    flatpak.enable = true;
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
    ghostty

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
  ];
}
