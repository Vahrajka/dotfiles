{  stdenvNoCC }:
stdenvNoCC.mkDerivation {
  pname = "FOT-Matisse-Pro";
  version = "0.1";
  src = ./FOT-Matisse-Pro.otf;
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/share/fonts/truetype/
    cp -r $src $out/share/fonts/truetype/
  '';
}

