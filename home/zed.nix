{ config, pkgs, lib, ... }:

{
  programs.zed-editor = {
    enable = true;

    userSettings = {
      vim_mode = false;
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      theme = "Tokyo Night";
      # "base_keymap": "VSCode",
    };
  };
}
