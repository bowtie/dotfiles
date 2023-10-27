{
  pkgs,
  config,
  ...
}: {
  boot.supportedFilesystems = ["ntfs"];

  boot.loader = {
    timeout = 3;
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # xanmod_latest might be better here
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
