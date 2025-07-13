{ config, pkgs, ... }:

{
  services.displayManager ={
    defaultSession = "hyprland" ;
    sddm ={
      wayland.enable = true;
      enable = true;
      theme = "sddm-theme";
      extraPackages = [ pkgs.libsForQt5.qtmultimedia 
			pkgs.libsForQt5.qtgraphicaleffects
		      ];
      };
    };
}
