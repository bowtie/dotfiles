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
      # "base_keymap": "VSCode",
    };
  };
}


