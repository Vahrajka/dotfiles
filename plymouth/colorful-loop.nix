{ stdenv ,fetchFromGitHub }:
{
  colorful-loop = stdenv.mkDerivation  {
    pname = "colorful-loop";
    version = "1.0.0";
    src = ./colorful_loop;
    dontBuild = true;
    installPhase = ''
    runHook preInstall

    mkdir -p $out/share/plymouth/themes/colorful-loop
    cp -r $src/* $out/share/plymouth/themes/colorful-loop
    find $out/share/plymouth/themes/ -name \*.plymouth -exec sed -i "s@\/usr\/@$out\/@" {} \;

    runHook postInstall
    '';
  };
}

