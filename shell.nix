# shell.nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "python-env";

  buildInputs = [
    pkgs.python313Full
    pkgs.python313Packages.matplotlib
    pkgs.python313Packages.pandas
    pkgs.python313Packages.jupyter
    pkgs.python312Packages.numpy
    pkgs.python313Packages.ipython
    pkgs.python312Packages.networkx
  ];
}
