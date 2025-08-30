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
    package = pkgs.tokyonight-gtk-theme;
    name = "tokyonight-gtk-theme";
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
