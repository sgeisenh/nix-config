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
      system = "aarch64-darwin";
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
