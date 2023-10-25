{
  inputs,
  pkgs,
  ...
}: let
  hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
  plugins = inputs.hyprland-plugins.packages.${pkgs.system};

  launcher = pkgs.writeShellScriptBin "hypr" ''
    #!/${pkgs.bash}/bin/bash

    exec ${hyprland}/bin/Hyprland
  '';
in {
  xdg.desktopEntries."org.gnome.Settings" = {
    name = "Settings";
    comment = "Gnome Control Center";
    icon = "org.gnome.Settings";
    exec = "env XDG_CURRENT_DESKTOP=gnome ${pkgs.gnome.gnome-control-center}/bin/gnome-control-center";
    categories = ["X-Preferences"];
    terminal = false;
  };

  home.packages = [launcher];
  home.file.".config/hypr/config".source = ../config/hypr;

  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland;
    systemd.enable = true;
    # enableNvidiaPatches = true;
    xwayland.enable = true;
    # plugins = [ hyprbars borderspp ];
    extraConfig = ''
      source=~/.config/hypr/config/monitors.conf
      source=~/.config/hypr/config/settings.conf
      source=~/.config/hypr/config/rules.conf
      source=~/.config/hypr/config/binds.conf
      source=~/.config/hypr/config/theme.conf
      source=~/.config/hypr/config/exec.conf
    '';
  };
}
