{
  pkgs,
  astalPkgs,
  agsPkgs,
  ...
}: {
  home.packages = [
    astalPkgs.astal3
    astalPkgs.astal4
    astalPkgs.auth
    astalPkgs.battery
    astalPkgs.bluetooth
    astalPkgs.cava
    astalPkgs.gjs
    astalPkgs.greet
    astalPkgs.hyprland
    astalPkgs.mpris
    astalPkgs.network
    astalPkgs.notifd
    astalPkgs.powerprofiles
    astalPkgs.river
    astalPkgs.tray
    astalPkgs.wireplumber
    astalPkgs.apps # might be a meta package
    astalPkgs.default # aliased to `astal`
    agsPkgs.agsFull
    pkgs.dart-sass
  ];
}
