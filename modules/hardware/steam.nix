{pkgs, ...}: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    package = pkgs.steam;
  };

  /*
  Enable udev rules for Steam hardware such as the Steam Controller,
  other supported controllers and the HTC Vive
  */
  hardware.steam-hardware.enable = true;
}
