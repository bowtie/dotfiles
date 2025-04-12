{ config, pkgs, lib, ... }:

{
  programs.zed = {
    enable = true;

    settings = {
      theme = "Tokyo Night";
      ui_font_size = 13;
      buffer_font_size = 13;
      vim_mode = false;
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      format_on_save = "on";
      autosave = "on_focus_change";

      # "base_keymap": "VSCode",
    };
  };
}