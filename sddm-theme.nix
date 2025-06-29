{ stdenv, fetchurl }:
{
  sddm-theme-dialog = stdenv.mkDerivation rec {
    pname = "sddm-astronaut-theme";
    version = "1.0.0";
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/sddm-astronaut-theme
    '';
    src = fetchurl {
      url = "https://github.com/Keyitdev/sddm-astronaut-theme";
      sha256 = "VE87Bkypc4cs5GAr4fYqX8xkR1iyPUGwri8FegGI2x4";

    };
  };
}
