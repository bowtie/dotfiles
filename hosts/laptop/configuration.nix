{ inputs, pkgs, username, ... }: {

  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-pc-laptop-ssd
    inputs.hardware.nixosModules.common-hidpi

    /etc/nixos/hardware-configuration.nix
    ./bootloader.nix
    ./gnome.nix
    ./hyprland.nix
    ./locale.nix
    ./nix.nix
    ./sound.nix
    ../../modules/adguard.nix
    ../../modules/dnscrypt-proxy.nix
    ../../modules/power-switcher.nix
  ];

  programs = {
    dconf.enable = true;
    fish.enable = true;
    auto-cpufreq.enable = true;
    auto-cpufreq.settings = {
      charger = {
        governor = "performance";
        turbo = "auto";
      };
      battery = {
        governor = "powersave";
        turbo = "auto";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    gnome.gnome-software # for flatpak
    home-manager
    git
    wget
    pulseaudio
    nerdfonts
  ];

  # use Wayland where possible (electron)
  environment.variables.NIXOS_OZONE_WL = "1";

  environment.shells = with pkgs; [ fish ];

  services = {
    xserver.enable = true;
    xserver.excludePackages = [ pkgs.xterm ];
    flatpak.enable = true;
    power-profiles-daemon.enable = false;
  };

  # KDE Connect
  networking.firewall = rec {
    allowedTCPPortRanges = [{ from = 1714; to = 1764; }];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };

  users.users.${username} = {
      isNormalUser = true;
      shell = pkgs.fish;
      extraGroups = ["networkmanager" "wheel"];
  };

  networking = {
    hostName = "swift";
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
