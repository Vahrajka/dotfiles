{ pkgs, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    amdctl
    distrobox
    wget
    linuxKernel.packages.linux_zen.xone
    git
    gcc
    mangohud
    xwayland-satellite
    xdg-desktop-portal-hyprland
    xdg-desktop-portal
    xdg-desktop-portal-gnome
    python3
    python313Packages.matplotlib
    python313Packages.scipy
    python313Packages.numpy
    (import ./../bin/wal-cache.nix { inherit pkgs;})
    (import ./../bin/brave-search.nix { inherit pkgs;})
    (import ./../bin/undervolt.nix { inherit pkgs;})
    (callPackage ./../sddm-theme/sddm-theme.nix {}).sddm-theme
    (callPackage ./../sddm-theme/darkouls-sddm.nix {}).darksouls-sddm
    (callPackage ./../grub-themes/CyberGRUB-2077.nix {}).CyberGRUB-2077
    (callPackage ./../grub-themes/Grub_Souls_III.nix {}).Grub_Souls_III
    (callPackage ./../plymouth/DS3_plymouth_theme.nix {}).DS3_plymouth_theme
    (callPackage ./../grub-themes/hollow-knight-grub.nix {}).hollow-knight-grub
    (callPackage ./../grub-themes/LainGrubTheme.nix {}).LainGrubTheme
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
    libX11
    libXcursor
    libXrandr
    libXinerama
    wayland
  ];

}
