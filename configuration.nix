{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfree = true;
  imports = [
      ./hardware-configuration.nix
      ./modules/boot.nix
      ./modules/bluetooth.nix
      ./modules/locale_time_keyboard.nix
      ./modules/network.nix
      ./modules/user.nix
      ./modules/systempkgs.nix
#      ./modules/graphics.nix
      ./modules/virtualisation.nix
      ./modules/audio.nix
      ./modules/steam.nix
      ./modules/sddm.nix
      ./modules/hyprland.nix
      ./modules/fonts.nix
      ./modules/powermanagement.nix
      ./modules/flatpak.nix
      ./modules/noctalia.nix
    ];
  services ={
    gvfs.enable = true;
    udisks2.enable = true;
    };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
    };
  networking.firewall.allowedTCPPorts = [ 53317 ];
  networking.firewall.allowedUDPPorts = [ 53317 5353 ];

  system.stateVersion = "25.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.starship.enable = true;
  security.polkit.enable = true;
 }

