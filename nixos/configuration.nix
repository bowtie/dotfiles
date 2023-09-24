{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-ssd

    ./hardware-configuration.nix
  ];

  nixpkgs = {
    overlays = [
      # later
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    registry = lib.mapAttrs (_: value: {flake = value;}) inputs;

    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  networking.hostName = "swift";

  boot.loader.systemd-boot.enable = true;

  users.users = {
    zsh = {
      initialPassword = "nixos";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # add later
      ];
      extraGroups = ["networkmanager", "wheel"];
    };
  };

  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = false;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
