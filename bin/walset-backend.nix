{ pkgs }:

pkgs.writeShellScriptBin "walset-backend" ''
  # Check if the user provided an argument
  if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <path_to_image>"
  exit 1
  fi

  IMAGE="$1"
  # Send notification to the user

  ${pkgs.libnotify}/bin/notify-send  "Changing Theme" "Applying new wallpaper and updating colors, please wait until confirmation..."

  # Set wallpaper

  ${pkgs.swww}/bin/swww img "$IMAGE" --transition-type wipe --transition-step 3 --transition-fps 60

  # Generate pywal colors
  ${pkgs.pywal16}/bin/wal -i "$IMAGE" -n -e

  # Refresh waybar
  systemctl --user restart waybar.service
  #change lockscreen
  wal-cache
  # Refresh swaync
  pkill -f ${pkgs.swaynotificationcenter}/bin/swaync 
  ${pkgs.swaynotificationcenter}/bin/swaync > /dev/null 2>&1 &

  ${pkgs.libnotify}/bin/notify-send "Theme Applied" "Wallpaper and theme updated successfully!"
''
