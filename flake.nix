{
  description = "Nix and home-manager configurations for sgeisenh";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, ... }:
    let mac-pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        x86-pkgs = nixpkgs.legacyPackages.x86_64-linux;
        configFromPkgs = pkgs: home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

	    modules = [
	        ./home.nix
	    ];
        };
    in {
      homeConfigurations.sgeisenh-mac = configFromPkgs mac-pkgs;
      homeConfigurations.sgeisenh-x86 = configFromPkgs x86-pkgs;
    };
}
