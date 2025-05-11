{
  pkgs,
  username,
  ...
}: {
  imports = [
    ../modules/shared
    ./disk.nix
    ./gnome.nix
    ./hardware.nix
    ./hyprland.nix
  ];

  hyprland.enable = true;
  gnome.enable = true;
  sunshine.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_zen;
  services.btrfs.autoScrub.enable = true;

  # Wayland + Hyprland fixes
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.QT_SCALE_FACTOR = "1.25";

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
