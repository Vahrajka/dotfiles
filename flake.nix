{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    home-manager.url= "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  
  outputs = { nixpkgs, home-manager, ... } @ inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in 
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { 
          inherit inputs;
          inherit system;
        };
        modules =[
        ./configuration.nix
        ];
      };
    homeConfigurations = {
      zayd = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
	./home.nix 
	];
      };

    };

  };
}
