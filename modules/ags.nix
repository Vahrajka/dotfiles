{ inputs, pkgs, ... }:

{
  imports = [ inputs.ags.homeManagerModules.default ];
  programs.ags = {
    enable = true;
    configDir = ./../ags;
    extraPackages = with pkgs; [
      inputs.astal.packages.${pkgs.system}.battery
      fzf
      gjs
      networkmanager
      astal.wireplumber
      astal.powerprofiles
      inputs.astal.packages.${pkgs.system}.notifd
      astal.network
      astal.tray
      astal.mpris
      astal.apps
    ];
  };
}
