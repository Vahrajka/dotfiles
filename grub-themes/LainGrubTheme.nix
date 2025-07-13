{ stdenv ,fetchFromGitHub }:
{
  LainGrubTheme = stdenv.mkDerivation  {
    pname = "LainGrubTheme";
    version = "1.0.1";
    src = fetchFromGitHub {
      owner = "uiriansan";
      repo = "LainGrubTheme";
      rev = "25cbd2ed2f031770b3bc3036deaacd64f5aefb2e";
      sha256 = "sha256-Ey/O/5Tlct7hUHakNHk4VIDruRExAuChc2jB4QAcGWI=";
      };
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/grub/themes
      cp -r $src/lain $out/grub/themes/LainGrubTheme
    '';
  };
}
