{
  inputs,
  pkgs,
  username,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-laptop-ssd
    inputs.hardware.nixosModules.common-hidpi

    /etc/nixos/hardware-configuration.nix
    ./bootloader.nix
    ../../modules/cache
    #../../modules/session/gnome.nix
    ../../modules/session/greetd.nix
    ../../modules/session/hyprland.nix
    ../../modules/language/locale.nix
    ../../modules/nix/nix.nix
    ../../modules/sound/audio.nix
    #../../modules/dns/adguard.nix
    #../../modules/dns/dnscrypt.nix
    ../../modules/power/switcher.nix
  ];

  programs = {
    dconf.enable = true;
    fish.enable = true;
  };

  environment.systemPackages = with pkgs; [
    home-manager
    git
    wget
    pulseaudio
    powertop
    zenstates
  ];

  # use Wayland where possible (electron)
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.shells = with pkgs; [fish];

  services = {
    xserver = {
      enable = true;
      excludePackages = [pkgs.xterm];
    };
    flatpak.enable = true;
    logind.lidSwitchExternalPower = "ignore";
    tailscale.enable = true;
  };

  powerManagement.powertop.enable = true;

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
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "video"
    ];
  };

  networking = {
    hostName = "swift";
    networkmanager.enable = true;
  };

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings.General.Experimental = true; # for gnome-bluetooth percentage
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
