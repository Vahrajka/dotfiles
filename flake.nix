{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager ={
      url= "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      };
   };
    
  
  outputs = { nixpkgs, nix-flatpak, nixpkgs-unstable, home-manager, ... } @ inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    unstable = nixpkgs-unstable.legacyPackages.${system}; 
  in 
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { 
          inherit inputs;
          inherit system;
          inherit unstable;
        };
        modules =[
        ./configuration.nix
	nix-flatpak.nixosModules.nix-flatpak
        ];
      };
    homeConfigurations = {
      zayd = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
	  inherit unstable;
          };
        modules = [
	./home.nix
	];
      };

    };

  };
}
