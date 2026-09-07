{ pkgs }:

pkgs.writeShellScriptBin "undervolt" ''
amdctl -p0 -v69
amdctl -p1 -v112
amdctl -p2 -v118
''
