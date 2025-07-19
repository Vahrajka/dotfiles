{ stdenv ,fetchFromGitHub }:
{
  darksouls-sddm = stdenv.mkDerivation  {
    pname = "sddm-theme";
    version = "1.0.0";
    src = fetchFromGitHub {
      owner = "Vahrajka";
      repo = "darksouls-sddm";
      rev = "36e3717d5832cc346c520010f1346c3d37ca71d8";
      sha256 = "";
      };
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -r $src $out/share/sddm/themes/darksouls-sddm
    '';
  };
}
