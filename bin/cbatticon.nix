{ stdenv, pkgs, fetchFromGitHub}:
{
  batticonplus = stdenv.mkDerivation  {
    pname = "batticonplus";
    buildInputs = [ pkgs.gtk2 pkgs.libnotify pkgs.pkg-config ];
    version = "1.6";
    src = fetchFromGitHub {
      owner = "artist4xlibre";
      repo = "batticonplus";
      rev = "15f03d31cb3e0b370afae0d5fe31e45c117db9f7";
      sha256 = "sha256-oFC3MMkUBjBU5zK79Nu15vW9mN+L0cVkctWKyJYJ9dU=";
      };
    buildPhase = ''
      make WITH_GTK3=0 
    '';
    installPhase = ''
      mkdir -p $out/bin
      make install PREFIX=$out
    '';
  };
}
