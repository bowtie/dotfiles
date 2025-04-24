{pkgs, ...}: let
  # Default applications
  terminal = "ghostty";

  # Imports
  windowrules = import ./windowrules.nix {inherit terminal;};
  keybindings = import ./keybindings.nix {inherit pkgs terminal;};
in {
  home.packages = with pkgs; [
    hyprpaper
    hyprpicker
    hypridle
    hyprlock
    hyprpolkitagent
    hyprsunset
    hyprcursor
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd = {
      enable = false;
      variables = [
        "--all"
      ]; # https://wiki.hyprland.org/Nix/Hyprland-on-Home-Manager/#programs-dont-work-in-systemd-services-but-do-on-the-terminal
    };
    package = null;
    portalPackage = null;

    extraConfig =
      # hyprlang
      ''
        general {
          gaps_out = 12,12,12,12 # for top bar
        }
        decoration {
          shadow {
            offset = 2 2
          }
        }
      '';
  };

  wayland.windowManager.hyprland.settings =
    keybindings
    // windowrules
    // {
      exec-once = [
        "dbus-update-activation-environment --systemd --all &"
        "systemctl --user start hyprpolkitagent"
        "systemctl --user enable --now hyprpaper.service &"
        "systemctl --user enable --now hypridle.service &"
      ];

      env = [
        "XDK_CURRENT_DESKTOP, Hyprland"
        "XDK_SESSION_TYPE, wayland"
        "XDK_SESSION_DESKTOP, Hyprland"

        "GDK_scale, 1"
        "GDK_BACKEND, wayland, x11, *"

        "QT_AUTO_SCREEN_SCALE_FACTOR, 1_SCALE_FACTOR, 1"
        "QT_QPA_PLATFORM, wayland; xcb"
        "QT_QPA_PLATFORMTHEME, gtk3"
        "QT_QPA_scale, 2"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"

        "MOZ_ENABLE_WAYLAND, 1"

        # Enable Ozone Wayland for electron apps
        "NIXOS_OZONE_WL, 1"
        "ELECTRON_OZONE_PLATFORM_HINT, auto"

        "XCURSOR_SIZE, 24"
        "XCURSOR_THEME, Bibata-Modern-Classic"
        "HYPRCURSOR_SIZE, 24"
        "HYPRCURSOR_THEME, Bibata-Modern-Classic"
      ];

      monitor = ",preferred,auto,1.0";
      xwayland.force_zero_scaling = true;

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      general = {
        layout = "dwindle";

        gaps_in = 4;
        gaps_out = 12;
        border_size = 1;

        resize_on_border = true;
        allow_tearing = false;
      };

      decoration = {
        rounding = 5;

        active_opacity = 1;
        inactive_opacity = 0.85;
        fullscreen_opacity = 1.0;

        shadow = {
          enabled = true;
          ignore_window = true;
          range = 4;
          render_power = 1;
        };

        blur = {
          enabled = true;
          new_optimizations = true;
          xray = true;
          size = 1;
          passes = 2;
          contrast = 1.2;
          noise = 0.02;
        };
      };

      animations = {
        enabled = true;
        first_launch_animation = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 2, myBezier"
          "windowsOut, 1, 2, default, popin 80%"
          "border, 1, 3, default"
          "borderangle, 1, 2, default"
          "fade, 1, 2, default"
          "workspaces, 1, 2, default"
        ];
      };

      #---------------#
      # Miscellaneous #
      #---------------#

      input = {
        follow_mouse = "1";
        sensitivity = "0";
        touchpad.natural_scroll = false;

        kb_layout = "pt";
      };

      gestures.workspace_swipe = false;

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
    };
}
