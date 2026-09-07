{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    home-manager ={
      url= "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      };
  }; 
  
  outputs = { nixpkgs, home-manager, nix-flatpak, ... } @ inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in 
  {
    nixosConfigurations.victus = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system nixpkgs; };
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
        specialArgs = { inherit inputs system nixpkgs; };
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
