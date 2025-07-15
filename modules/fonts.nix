{ pkgs, ... }:

{
   fonts.packages = with pkgs; [nerd-fonts.caskaydia-mono
	                      (callPackage ./../fonts/ArcadeClassic.nix {})
	                      (callPackage ./../fonts/Electroharmonix.nix {})
	                      ];
}

