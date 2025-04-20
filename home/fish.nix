{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    functions = {
      nix-update = ''
        function nix-update; sudo nixos-rebuild switch --flake ~/dotfiles/.#$argv; end
      '';

      home-update = ''
        function home-update; home-manager switch --flake ~/dotfiles/.#$argv; end
      '';
    };

    # Set the editors for terminal & GUI
    interactiveShellInit = ''
      # Disable the default Fish greeting
      function fish_greeting
      end

      # Run Fastfetch on Fish startup
      if status is-interactive
          fastfetch
      end

      set -gx EDITOR micro
      set -gx VISUAL zed
    '';
  };

  programs.direnv.enable = true;
}
