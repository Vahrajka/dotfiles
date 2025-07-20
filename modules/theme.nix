{ pkgs, ...}:

{
  
home.pointerCursor = {
  gtk.enable = true;
  package = pkgs.bibata-cursors;
  name = "Bibata-Modern-Classic";
  size = 24;
};

gtk = {
  enable = true;
  theme = {
    package = pkgs.catppuccin-gtk;
    name = "catppuccin-gtk";
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
}
