{ pkgs }:

pkgs.writeShellScriptBin "brave-search" ''

query=$(rofi -dmenu -theme ~/dotfiles/rofi/spotlight.rasi -p "Search Brave: ")

if [ -n "$query" ]; then
    encoded_query=$(echo "$query" | sed 's/ /+/g')
    librewolf "https://search.brave.com/search?q=$encoded_query" &
fi
''
