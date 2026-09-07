{ pkgs, ... }:

{
  services.displayManager ={
    defaultSession = "niri" ;
    sddm ={
      wayland.enable = true;
      package = pkgs.kdePackages.sddm ;
      enable = false;
      theme = "darksouls-sddm";
      extraPackages = [ pkgs.kdePackages.qtmultimedia 
			pkgs.kdePackages.qtquickeffectmaker
			pkgs.kdePackages.qtbase
			pkgs.kdePackages.qtsvg
			pkgs.kdePackages.qtvirtualkeyboard
		      ];
	 };
   ly.enable = true;
    };
}
