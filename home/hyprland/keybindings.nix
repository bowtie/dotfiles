{terminal, ...}: let
  # Default applications
  browser = "firefox";
  file-manager = "nautilus";
in {
  "$mod" = "SUPER";

  bindm = [
    "$mod, mouse:272, resizewindow"
    "$mod, mouse:273, movewindow"
  ];

  binde = [
    # Resize windows
    "$mod ALT, H, resizeactive, -10 0"
    "$mod ALT, L, resizeactive, 10 0"
    "$mod ALT, K, resizeactive, 0 -10"
    "$mod ALT, J, resizeactive, 0 10"
  ];

  bind =
    [
      # Launch
      "$mod, Return, exec, ${terminal}"
      "$mod, E, exec, ${file-manager}"
      "$mod, W, exec, ${browser}"

      # Reload
      # I use this binding to manually reload config changes.
      # Having AGS reload also serves as a good visual indicator.
      # You can replace it with any bar (e.g. waybar) you like.
      "$mod, R, exec, hyprctl reload config-only"
      "$mod, R, exec, ags quit ; ags run ~/Projects/natsume-gtk3/ &"

      # Toggle fullscreen
      "$mod, F, fullscreen"

      # Exit
      "ALT, Q, killactive"

      # Switch focus
      "$mod, H, movefocus, l"
      "$mod, L, movefocus, r"
      "$mod, K, movefocus, u"
      "$mod, J, movefocus, d"

      # Move windows
      "$mod SHIFT, H, movewindow, l"
      "$mod SHIFT, L, movewindow, r"
      "$mod SHIFT, K, movewindow, u"
      "$mod SHIFT, J, movewindow, d"
    ]
    ++ (
      # Workspaces
      # $mod + {1..10} for workspace {1..10}
      # $mod + shift + {1..10} for move to workspace {1..10}
      builtins.concatLists (
        builtins.genList (
          x: let
            ws = let
              c = (x + 1) / 10;
            in
              builtins.toString (x + 1 - (c * 10));
          in [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]
        )
        10
      )
    );
}
