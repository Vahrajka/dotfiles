{ pkgs, ... }:

{
  services.displayManager ={
    defaultSession = "hyprland" ;
    sddm ={
      wayland.enable = true;
      package = pkgs.kdePackages.sddm ;
      enable = true;
      theme = "darksouls-sddm";
      extraPackages = [ pkgs.kdePackages.qtmultimedia 
			pkgs.kdePackages.qtquickeffectmaker
			pkgs.kdePackages.qtbase
			pkgs.kdePackages.qtsvg
			pkgs.kdePackages.qtvirtualkeyboard
		      ];
	 };
    };
}
