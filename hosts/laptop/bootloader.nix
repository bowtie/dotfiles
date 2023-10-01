{ pkgs, config, ... }:{
  boot.supportedFilesystems = [ "ntfs" ];

  boot.loader = {
    timeout = 3;
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # build and load custom drivers
  # boot.extraModulePackages = with config.boot.kernelPackages; [
  #   (callPackage ../../pkgs/acer-wmi-battery.nix {})
  # ];
  # boot.kernelModules = [ "acer-wmi-battery" ];
  
  boot.kernelParams = [
    "module_blacklist=uvcvideo"
  ];
}