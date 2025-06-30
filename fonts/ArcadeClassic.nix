{  stdenvNoCC, lib,}:
stdenvNoCC.mkDerivation {
  pname = "ARCADECLASSIC";
  version = "0.1";
  src = ./ArcadeClassic/ARCADECLASSIC.TTF;
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/share/fonts/truetype/
    cp -r $src $out/share/fonts/truetype/
  '';
}

