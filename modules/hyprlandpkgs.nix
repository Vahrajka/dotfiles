{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    waypaper
    hyprshot
    hyprpicker
    rofi
    wlogout
    hyprlock
    kitty
    cava
    pipes-rs
    swww
    lsd
    btop
    pywal16
    pywalfox-native
    cmatrix
    swaynotificationcenter
    wlogout
    networkmanagerapplet
    fastfetch
    brightnessctl
    cbonsai
    pavucontrol
    ];
}
