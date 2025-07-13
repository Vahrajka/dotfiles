{ config, pkgs, ... }:

{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["zayd"];
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
    waydroid.enable = true;
    };
}


