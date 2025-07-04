{ stdenv ,fetchFromGitHub }:
{
  grub-theme = stdenv.mkDerivation  {
    pname = "CyberGRUB-2077";
    version = "2.0.0";
    src = fetchFromGitHub {
      owner = "adnksharp";
      repo = "CyberGRUB-2077";
      rev = "8f64252af02302c76bbcd729e37e67a9db74e155";
      sha256 = "sha256-UQZ7SM32ddhB+0RYXCNB9RX6LdjbSJbDbYOvToailhU=";
      };
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/grub/themes
      cp -r $src/CyberGRUB-2077 $out/grub/themes/CyberGRUB-2077
    '';
  };
}
