{ pkgs }:


pkgs.writeShellScriptBin "protonhax" (builtins.readFile ./protonhax)
