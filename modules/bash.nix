{ ... }:

{
  programs = {
    starship.enable = true;
    bash = {
      enable = true;
      shellAliases = {
        ls = "lsd";
        ll = "lsd -lah --group-directories-first";
        rc = "nvim ~/dotfiles/hyprland/hyprland.conf";
        vim = "nvim";
        ranger = "ranger --confdir ~/dotfiles/ranger";
        nb = "sudo nixos-rebuild switch --flake";
	};
    };
   };
}
    
  
