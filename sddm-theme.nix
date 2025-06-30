{ stdenv }:
{
  sddm-theme = stdenv.mkDerivation  {
    pname = "sddm-theme";
    version = "1.0.0";
    src = ./sddm-theme;
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -r $src $out/share/sddm/themes/sddm-theme
    '';
  };
}
