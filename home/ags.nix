{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];

  home.packages = with pkgs; [
    sassc
    (python311.withPackages (p: [p.python-pam]))
  ];

  programs.ags = {
    enable = true;
    configDir = ../config/ags;
    # extraPackages = with pkgs; [
    #   libgtop
    #   libnotify
    # ];
  };
}
