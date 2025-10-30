{ pkgs, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    inputs.noctalia.packages.${system}.default
    wget
    git
    gcc
    mangohud
    protonup
    xdg-desktop-portal-hyprland
    (import ./../bin/wal-cache.nix { inherit pkgs;})
    (import ./../bin/brave-search.nix { inherit pkgs;})
    (callPackage ./../sddm-theme/sddm-theme.nix {}).sddm-theme
    (callPackage ./../sddm-theme/darkouls-sddm.nix {}).darksouls-sddm
    (callPackage ./../grub-themes/CyberGRUB-2077.nix {}).CyberGRUB-2077
    (callPackage ./../grub-themes/hollow-knight-grub.nix {}).hollow-knight-grub
    (callPackage ./../grub-themes/LainGrubTheme.nix {}).LainGrubTheme
    (callPackage ./../bin/cbatticon.nix {}).batticonplus
  ];
  programs.coolercontrol.enable = true;
  programs.coolercontrol.nvidiaSupport = true;
}
