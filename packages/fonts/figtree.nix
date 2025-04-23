{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:
stdenvNoCC.mkDerivation {
  pname = "Figtree";
  version = "2.0.3";

  src = fetchFromGitHub {
    owner = "erikdkennedy";
    repo = "figtree";
    rev = "v2.0.3";
    sha256 = "sha256-owzoM0zfKYxLJCQbL1eUE0cdSLVmm+QNRUGxbsNJ37I=";
  };

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    cp $src/fonts/ttf/*.ttf $out/share/fonts/truetype/
  '';

  meta = with lib; {
    description = "Figtree font";
    homepage = "https://github.com/erikdkennedy/figtree";
    license = licenses.ofl;
  };
}
