{pkgs, ...}: {
  fonts.packages = with pkgs; [
    adwaita-fonts
    inter
    nerd-fonts.jetbrains-mono
    geist-font
    (callPackage ../../packages/fonts/figtree.nix {})
  ];

  fonts.fontDir.enable = true;
}
