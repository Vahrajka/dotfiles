{ pkgs, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    inputs.noctalia.packages.${system}.default
    wget
    linuxKernel.packages.linux_zen.xone
    git
    gcc
    mangohud
    xwayland-satellite
    xdg-desktop-portal-hyprland
    xdg-desktop-portal
    xdg-desktop-portal-gnome
    (import ./../bin/wal-cache.nix { inherit pkgs;})
    (import ./../bin/protonhax.nix { inherit pkgs;})
    (import ./../bin/brave-search.nix { inherit pkgs;})
    (callPackage ./../sddm-theme/sddm-theme.nix {}).sddm-theme
    (callPackage ./../sddm-theme/darkouls-sddm.nix {}).darksouls-sddm
    (callPackage ./../grub-themes/CyberGRUB-2077.nix {}).CyberGRUB-2077
    (callPackage ./../grub-themes/Grub_Souls_III.nix {}).Grub_Souls_III
    (callPackage ./../plymouth/DS3_plymouth_theme.nix {}).DS3_plymouth_theme
    (callPackage ./../grub-themes/hollow-knight-grub.nix {}).hollow-knight-grub
    (callPackage ./../grub-themes/LainGrubTheme.nix {}).LainGrubTheme
    (callPackage ./../bin/cbatticon.nix {}).batticonplus
  ];
  nixpkgs.config.permittedInsecurePackages = [
                "electron-36.9.5"
              ];
  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
    glib
    gtk3
    gobject-introspection
    libffi
    cairo
    pango
    libxml2
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXinerama
    wayland
  ];

}
