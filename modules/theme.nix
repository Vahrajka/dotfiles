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
