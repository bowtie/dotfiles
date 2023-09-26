{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix
    ./bootloader.nix
    ./gnome.nix
    ./hyprland.nix
    ./locale.nix
    ./nix.nix
    ./nvidia.nix
    ./sound.nix
  ];

  virtualisation = {
    podman.enable = true;
    libvirtd.enable = true;
  };

  programs = {
    dconf.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnome.gnome-software # for flatpak
    home-manager
    neovim
    git
    wget
  ];

  services = {
    xserver.enable = true;
    xserver.excludePackages = [ pkgs.xterm ];
    flatpak.enable = true;
  };

  # KDE Connect
  networking.firewall = rec {
    allowedTCPPortRanges = [{ from = 1714; to = 1764; }];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };

  users.users = {
    zsh = {
      isNormalUser = true;
      extraGroups = ["networkmanager", "wheel"];
    };
  };

  networking = {
    hostName = "miya";
    networkmanager.enable = true;
  };

  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = false;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
