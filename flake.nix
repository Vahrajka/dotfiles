{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager ={
      url= "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      };
  }; 
  
  outputs = { nixpkgs, nix-flatpak, nixpkgs-unstable, home-manager, ... } @ inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    unstable = nixpkgs-unstable.legacyPackages.${system}; 
  in 
  {
    nixosConfigurations.victus = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system unstable nixpkgs; };
        modules =[
        ./configs/victus.nix
	nix-flatpak.nixosModules.nix-flatpak
	home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
	    extraSpecialArgs = { inherit system inputs; };
            users.zayd = import ./home.nix;
            backupFileExtension = "backup";
            };
          }
	];
      };
    nixosConfigurations.thinkpad = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system unstable nixpkgs; };
        modules =[
        ./configs/thinkpad.nix
	nix-flatpak.nixosModules.nix-flatpak
	home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
	    extraSpecialArgs = { inherit system inputs; };
            users.zayd = import ./home.nix;
            backupFileExtension = "backup";
            };
          }
	];
      };

  };
}
