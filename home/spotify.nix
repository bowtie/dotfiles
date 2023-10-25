{
  pkgs,
  lib,
  spicetify-nix,
  ...
}: let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in {
  # allow spotify to be installed if you don't have unfree enabled already
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "spotifywm"
    ];

  # import the flake's module for your system
  imports = [spicetify-nix.homeManagerModule];

  # configure spicetify :)
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.Catppuccin;
    colorScheme = "mocha";

    enabledCustomApps = with spicePkgs.apps; [
      lyrics-plus
      new-releases
      reddit
    ];

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      autoSkipVideo
      autoVolume
      copyToClipboard
      fullAlbumDate
      hidePodcasts
      history
      playlistIcons
      shuffle # shuffle+ (special characters are sanitized out of ext names)
      volumePercentage
    ];
  };
}
