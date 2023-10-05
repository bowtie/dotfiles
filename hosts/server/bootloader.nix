{
  pkgs,
  config,
  ...
}: {
  boot.loader = {
    timeout = 3;
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
}
