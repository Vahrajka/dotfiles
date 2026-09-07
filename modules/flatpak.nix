{ ... }:

{
  services.flatpak = {
    enable = true;
    packages = [
      "org.nickvision.tubeconverter"
      "com.indomitusgroup.indipdf"
      "com.github.tchx84.Flatseal"
      "io.github.wartybix.Constrict"
      "org.spyder_ide.spyder"
      "eu.betterbird.Betterbird"
      "org.thonny.Thonny"
      "com.spotify.Client"
      "com.usebottles.bottles"


    ];
  };
}
