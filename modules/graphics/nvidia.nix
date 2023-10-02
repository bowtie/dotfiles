{config, ...}: {
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement = {
      enable = true;
      finegrained = false;
    };

    open = false;
    nvidiaSettings = true; # gui app
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  # nvidia hyprland patches
  wayland.windowManager.hyprland.enableNvidiaPatches = true;
  programs.hyprland.enableNvidiaPatches = true;
}
