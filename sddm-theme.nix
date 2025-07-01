{ stdenv ,fetchFromGitHub }:
{
  sddm-theme = stdenv.mkDerivation  {
    pname = "sddm-theme";
    version = "1.0.0";
    src = fetchFromGitHub {
      owner = "Vahrajka";
      repo = "sddm-theme";
      rev = "54ba43edeaec039a982bce0e84ed467de0ad7bd2";
      sha256 = "sha256-m2Jt1qowBKhpTm6MbDCr70OaJ6VPXfwT8ojjen3Nslo=";
      };
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -r $src $out/share/sddm/themes/sddm-theme
    '';
  };
}
