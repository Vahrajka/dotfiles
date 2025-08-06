{ ... }:

{
  services.flatpak = {
    enable = true;
    packages = [
      "org.nickvision.tubeconverter"
      "io.github.wartybix.Constrict"
      "org.spyder_ide.spyder"
      "eu.betterbird.Betterbird"
    ];
  };
}
