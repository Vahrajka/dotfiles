{ inputs, config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "zayd";
  home.homeDirectory = "/home/zayd";
  home.stateVersion = "23.05"; # Please read the comment before changing.
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    waybar
    woeusb
    protonup
    libsForQt5.kdeconnect-kde
    libsForQt5.partitionmanager
    kdePackages.dolphin-plugins
    lshw
    qbittorrent
    matugen
    waypaper
    equibop
    gjs
    fastfetch
    wl-clipboard
    kdePackages.okular
    popsicle
    gparted
    kdePackages.gwenview
    usbutils
    glib
    pywalfox-native
    numix-cursor-theme
    libnotify
    nautilus
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
    mate.mate-polkit
    swww
    fzf
    lsd
    neovim
    kdePackages.dolphin
    imagemagick
    tree
  ];

home.pointerCursor = {
  gtk.enable = true;
  package = pkgs.bibata-cursors;
  name = "Bibata-Modern-Classic";
  size = 16;
};

gtk = {
  enable = true;
  theme = {
    package = pkgs.flat-remix-gtk;
    name = "Flat-Remix-GTK-Grey-Darkest";
  };

  iconTheme = {
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
  };

  font = {
    name = "Sans";
    size = 11;
  };
};
  home.file = {
    ".config/hypr/".source = ./hyprland;
    ".config/waybar/".source = ./waybar;
    ".config/swaync/".source = ./swaync;
    ".config/wlogout".source = ./wlogout;
    ".config/matugen".source = ./matugen;
    ".config/alacritty/alacritty.toml".source = ./alacritty/alacritty.toml;
    ".bashrc".source = ./bash/.bashrc;
    };
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\\\${HOME}/.steam/root/compatibilitytools.d";
  };
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    extraPackages = with pkgs; [
      inputs.ags.packages.${pkgs.system}.battery
      inputs.ags.packages.${pkgs.system}.network
      inputs.ags.packages.${pkgs.system}.hyprland
      inputs.ags.packages.${pkgs.system}.bluetooth
      inputs.ags.packages.${pkgs.system}.mpris
      inputs.ags.packages.${pkgs.system}.tray
      inputs.ags.packages.${pkgs.system}.wireplumber
      inputs.ags.packages.${pkgs.system}.notifd
      fzf
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
