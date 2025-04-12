{lib, ...}: {
  boot = {
    initrd = {
      availableKernelModules = ["nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc"];
      kernelModules = ["amd_pstate" "amdgpu" "ideapad_laptop"];
    };
    kernelModules = ["kvm-amd"];
    # kernelParams = ["nowatchdog"];
  };

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  services.xserver.dpi = 157;
}
