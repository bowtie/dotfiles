{
  pkgs,
  lib,
  ...
}: let
  systemd = pkgs.systemd;
  libpciaccess = pkgs.xorg.libpciaccess;

  # xorgproto-explicit-sync-git
  xorgproto-patched = pkgs.xorg.xorgproto.overrideAttrs (o: {
    patches =
      (o.patches or [])
      ++ [
        ./patches/59.patch
      ];
  });

  # xcbproto-explicit-sync-git
  xcbproto-patched = pkgs.xorg.xcbproto.overrideAttrs (o: {
    patches =
      (o.patches or [])
      ++ [
        ./patches/45.patch
      ];
  });

  # wayland-protocols-explicit-sync-git
  wayland-protocols-patched = pkgs.wayland-protocols.overrideAttrs (o: {
    patches =
      (o.patches or [])
      ++ [
        ./patches/90.patch
      ];
  });

  # xorg-xwayland-explicit-sync-git
  xwayland-patched = pkgs.xwayland.overrideAttrs (o: {
    buildInputs =
      (o.buildInputs or [])
      ++ [
        systemd
        libpciaccess
      ];
    src = builtins.fetchGit {
      url = "https://gitlab.freedesktop.org/ekurzinger/xserver/";
      ref = "explicit-sync";
      rev = "b28cb0a1dd8872a667843c6be297588ba5c405e9";
    };
    # patches =
    #   (o.patches or [])
    #   ++ [
    #     ./patches/967.patch
    #   ];
  });
in {
  environment.systemPackages = with pkgs; [
    xorgproto-patched
    xcbproto-patched
    wayland-protocols-patched
  ];

  programs.xwayland = {
    enable = true;
    package = xwayland-patched;
  };
}
