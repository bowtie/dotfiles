{
  boot.supportedFilesystems = [ "ntfs" ];

  boot.loader = {
    timeout = 3;
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  #build and load custom drivers
  boot.extraModulePackages = with config.boot.kernelPackages; [
    (callPackage ../../packages/acer-wmi-battery.nix {})
  ];
  boot.kernelModules = [ "acer-wmi-battery" "amd-pstate" ];
  boot.kernelParams = [
    "initcall_blacklist=acpi_cpufreq_init"
    "amd_pstate.shared_mem=1"
  ];
}