{ config, pkgs, unstable,... }:

{
  imports = [
    ./modules/theme.nix
    ./modules/homepkgs.nix
    ./modules/bash.nix
    ./modules/waybar.nix
    ./modules/hyprlandpkgs.nix
    ];

  home.file = {
    ".config/hypr/".source = ./hyprland;
    ".config/waybar/".source = ./waybar;
    ".config/swaync/".source = ./swaync;
    ".config/wlogout".source = ./wlogout;
    ".config/matugen".source = ./matugen;
    ".config/noctalia/user-templates.toml".source = ./noctalia/user-templates.toml;
    ".config/noctalia/templates".source = ./noctalia/templates;
    ".config/fastfetch".source = ./fastfetch;
    ".config/alacritty/alacritty.toml".source = ./alacritty/alacritty.toml;
    ".config/waypaper".source = ./waypaper;
    ".config/ranger".source = ./ranger;
    ".config/nvim".source = ./nvim;
    };


  home.username = "zayd";
  home.homeDirectory = "/home/zayd";
  home.stateVersion = "25.05"; # Please read the comment before changing.
     home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\\\${HOME}/.steam/root/compatibilitytools.d";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  services.batsignal.enable = true;

}
