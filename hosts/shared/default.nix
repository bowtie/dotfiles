{
  imports = [
    ./cache.nix
    ./disk.nix
    ./fonts.nix
    ./gnome.nix
    ./hyprland.nix
    ./locale.nix
    ./packages.nix
    ./sunshine.nix
  ];

  documentation.nixos.enable = false;
  nixpkgs.config.allowUnfree = true;

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };

    settings = {
      experimental-features = "nix-command flakes";

      max-jobs = "auto";
      use-xdg-base-directories = true;
      http-connections = 128;
      max-substitution-jobs = 128;
      log-lines = 25;
      auto-optimise-store = true;
      builders-use-substitutes = true;

      keep-derivations = true;
      keep-outputs = true;

      trusted-users = ["root" "@wheel" "zoushie"];
    };
  };
}
