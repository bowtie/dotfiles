{
  stdenv,
  fetchFromGitHub,
  lib,
  meson,
  ninja,
  pkg-config,
  qtbase,
  qttools,
  wrapQtAppsHook,
  enableExperimental ? false,
  includeMatrixDiscovery ? false,
}: let
  version = "unstable-2023-10-17";
  pname = "razergenie";
in
  stdenv.mkDerivation {
    inherit pname version;

    src = fetchFromGitHub {
      owner = "z3ntu";
      repo = "RazerGenie";
      rev = "5e5a0ae2df95e34c55d82db6ed7c4df0fa412a3d";
      sha256 = "174llbd68yryrs8zvfxxcdfa80hkwvfglswr3rxmi0wq4wv594f6";
    };

    nativeBuildInputs = [
      pkg-config
      meson
      ninja
      wrapQtAppsHook
    ];

    buildInputs = [
      qtbase
      qttools
    ];

    mesonFlags = [
      "-Denable_experimental=${lib.boolToString enableExperimental}"
      "-Dinclude_matrix_discovery=${lib.boolToString includeMatrixDiscovery}"
    ];

    meta = with lib; {
      homepage = "https://github.com/z3ntu/RazerGenie";
      description = "Qt application for configuring your Razer devices under GNU/Linux";
      license = licenses.gpl3;
      maintainers = with maintainers; [f4814n Mogria];
      platforms = platforms.linux;
    };
  }
