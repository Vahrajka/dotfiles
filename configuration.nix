{ config, pkgs, lib , ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./modules/boot.nix
      ./modules/bluetooth.nix
      ./modules/locale_time_keyboard.nix
      ./modules/network.nix
      ./modules/user.nix
      ./modules/systempkgs.nix
      ./modules/graphics.nix
      ./modules/virtualisation.nix
      ./modules/audio.nix
      ./modules/steam.nix
      ./modules/sddm.nix
      ./modules/hyprland.nix
      ./modules/fonts.nix
      ./modules/powermanagement.nix
      ./modules/flatpak.nix
    ];
  services ={
    gvfs.enable = true;
    udisks2.enable = true;
    };
  system.stateVersion = "25.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.starship.enable = true;
  security.polkit.enable = true;
 }

