{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-gpu-intel
    inputs.hardware.nixosModules.common-pc
    inputs.hardware.nixosModules.common-pc-ssd

    /etc/nixos/hardware-configuration.nix
    ./bootloader.nix
    ../../modules/language/locale.nix
    ../../modules/nix/nix.nix
    ../../modules/dns/adguard.nix
    ../../modules/dns/dnscrypt.nix
  ];

  programs = {
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

  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel"];
  };

  networking = {
    hostName = "kana";
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
