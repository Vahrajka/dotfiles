{ config, pkgs, ... }:

{
  users.users.zayd = {
    isNormalUser = true;
    description = "zayd";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

}
