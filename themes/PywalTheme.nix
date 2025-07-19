{ stdenv }:
{
  PywalTheme = stdenv.mkDerivation  {
    pname = "PywalTheme";
    version = "1.0.0";
    src = ./PywalTheme;
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/themes
      cp -r $src $out/share/themes
    '';
  };
}
