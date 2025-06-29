{ pkgs }:

pkgs.writeShellScriptBin "walset" ''
  
WALL_DIR="/$HOME/wallpapers"
CWD="$(pwd)"

cd "$WALL_DIR" || exit

IFS=$'\n'

SELECTED_WALL=$(for a in *.jpeg *.jpg *.png; do echo -en "$a\0icon\x1f$a\n" ; done | ${pkgs.rofi}/bin/rofi -dmenu -theme ~/dotfiles/rofi/fullscreen-preview.rasi -p "")

if [ -n "$SELECTED_WALL" ]; then
    walset-backend "$SELECTED_WALL"

fi

cd "$CWD" || exit
''
