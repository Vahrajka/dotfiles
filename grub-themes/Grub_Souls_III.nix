{ stdenv ,fetchFromGitHub }:
{
  Grub_Souls_III = stdenv.mkDerivation  {
    pname = "Grub_Souls_III";
    version = "1.0.0";
    src = fetchFromGitHub {
      owner = "PedroMMarinho";
      repo = "grubsouls-theme";
      rev = "86cb6f46530f42fe45478f7f79fba647c946eb19";
      sha256 = "sha256-w1dP3JyTGOPQHxrv587vuLEhYd7vPKyHC4LuWLuN2p4=";
      };
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/grub/themes
      cp -r $src/grubsouls $out/grub/themes/Grub_Souls_III
    '';
  };
}
