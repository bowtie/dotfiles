{
  lib,
  config,
  ...
}: {
  options.sunshine = {
    enable = lib.mkEnableOption "Sunshine";
  };

  config = lib.mkIf config.sunshine.enable {
    services.sunshine = {
      enable = true;
      autoStart = true;
      capSysAdmin = true;
      openFirewall = true;
    };
  };
}
