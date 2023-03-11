{
  description = "Home Manager configuration of sgeisenh";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
      homeManagerConfig = {
        nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlay ];
        nixpkgs.config.allowUnfree = true;
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.sgeisenh = import ./home.nix;
      };
      system = "x86_64-linux";
      overlays = [ inputs.neovim-nightly-overlay.overlay ];
      pkgs = import nixpkgs {
        inherit system overlays;
      };
    in
    {
      homeConfigurations.sgeisenh = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home.nix
        ];
      };
    };
}
