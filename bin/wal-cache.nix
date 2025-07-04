{ pkgs }:

pkgs.writeShellScriptBin "wal-cache" ''
  # Define cache directory
  CACHE_DIR="$HOME/dotfiles/bin"

  # Fetch the wallpaper path from swww
  wallpaper_path=$(${pkgs.swww}/bin/swww query | head -n1 | awk '{print $8}')

  # Copy the wallpaper to the cache directory (if it's not already there)
  cp "$wallpaper_path" "$CACHE_DIR"/current-wallpaper

''
