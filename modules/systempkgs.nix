{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    gcc
    mangohud
    protonup
    xdg-desktop-portal-hyprland
    (import ./../bin/wal-cache.nix { inherit pkgs;})
    (import ./../bin/brave-search.nix { inherit pkgs;})
    (callPackage ./../sddm-theme.nix {}).sddm-theme
    (callPackage ./../grub-themes/CyberGRUB-2077.nix {}).CyberGRUB-2077
    (callPackage ./../grub-themes/hollow-knight-grub.nix {}).hollow-knight-grub
    (callPackage ./../grub-themes/LainGrubTheme.nix {}).LainGrubTheme
  ];
}
