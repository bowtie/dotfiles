{
  pkgs,
  config,
  ...
}: {
  boot = {
    tmp.cleanOnBoot = true;
    supportedFilesystems = ["ntfs"];

    loader = {
      timeout = 3;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_latest;

    # build and load custom drivers
    # boot.extraModulePackages = with config.boot.kernelPackages; [
    #  (callPackage ../../pkgs/acer-wmi-battery.nix {})
    # ];
    # boot.kernelModules = [ "acer-wmi-battery" ];

    kernelParams = [
      "module_blacklist=uvcvideo"
      "ivrs_ioapic=4@0000:00:14.0"
      "ivrs_ioapic=5@0000:00:00.2"
    ];
  };
}
