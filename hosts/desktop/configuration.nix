{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-cpu-amd-pstate
    inputs.hardware.nixosModules.common-pc-ssd

    /etc/nixos/hardware-configuration.nix
    ./bootloader.nix
    ../../modules/session/kde.nix
    ../../modules/session/hyprland.nix
    ../../modules/graphics/nvidia.nix
    ../../modules/language/locale.nix
    ../../modules/nix/nix.nix
    ../../modules/sound/sound.nix
  ];

  virtualisation = {
    podman.enable = true;
    libvirtd.enable = true;
  };

  programs = {
    dconf.enable = true;
    fish.enable = true;
  };

  environment.shells = with pkgs; [fish];

  environment.systemPackages = with pkgs; [
    home-manager
    git
    wget
  ];

  services = {
    xserver.enable = true;
    xserver.excludePackages = [pkgs.xterm];
    flatpak.enable = true;
  };

  # KDE Connect
  networking.firewall = rec {
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };

  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel"];
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
