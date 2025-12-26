{ stdenv ,fetchFromGitHub }:
{
  DS3_plymouth_theme = stdenv.mkDerivation  {
    pname = "ds3";
    version = "1.0.0";
    src = ./plymouth-ds3;
    dontBuild = true;
    installPhase = ''
    runHook preInstall

    mkdir -p $out/share/plymouth/themes/ds3
    cp -r $src/plymouth/* $out/share/plymouth/themes/ds3
    find $out/share/plymouth/themes/ -name \*.plymouth -exec sed -i "s@\/usr\/@$out\/@" {} \;

    runHook postInstall
    '';
  };
}

