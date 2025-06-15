{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "zayd";
  home.homeDirectory = "/home/zayd";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.
  nixpkgs.config.allowUnfree = true;
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    waybar
    lshw
    libnotify
    lutris
    alsa-utils
    brightnessctl
    heroic
    shadps4
    rpcs3
    mission-center
    rofi
    hyprshot
    hyprpicker
    pavucontrol
    blueman
    wlogout
    swaynotificationcenter
    hyprlock
    networkmanagerapplet
    wev
    kitty
    onlyoffice-desktopeditors
    nixd
    freecad
    cmatrix
    bitwarden-desktop
    libreoffice-qt6
    cava
    pipes-rs
    alacritty
    xorg.xrandr
    pywal16
    librewolf
    swww
    fzf
    lsd
    neovim
    kdePackages.dolphin
    imagemagick
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/hypr/".source = ./hyprland;
    ".config/waybar/".source = ./waybar;
    ".config/swaync/".source = ./swaync;
    ".config/wlogout".source = ./wlogout;
    ".config/alacritty/alacritty.toml".source = ./alacritty/alacritty.toml;
    ".local/bin/".source = ./bin;
    ".bashrc".source = ./bash/.bashrc;
    };
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
