{  stdenvNoCC }:
stdenvNoCC.mkDerivation {
  pname = "Electroharmonix";
  version = "0.1";
  src = ./Electroharmonix/Electroharmonix.otf;
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/share/fonts/truetype/
    cp -r $src $out/share/fonts/truetype/
  '';
}

