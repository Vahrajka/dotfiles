{ stdenv ,fetchFromGitHub }:
{
  hollow-knight-grub = stdenv.mkDerivation  {
    pname = "hollow-knight-grub";
    version = "2.0.0";
    src = fetchFromGitHub {
      owner = "sergoncano";
      repo = "hollow-knight-grub-theme";
      rev = "d0490ca2d573310fdd37018befd23217eccd7105";
      sha256 = "sha256-SUy2bQIeUWb/UdQip1ZhBTvXSHJ/LaHhpeK9DGQht6w=";
      };
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/grub/themes
      cp -r $src/hollow-grub $out/grub/themes/hollow-knight-grub
    '';
  };
}
