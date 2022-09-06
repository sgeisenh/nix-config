{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  imports = (import ./programs);

  home = {
    username = "sgeisenh";
    homeDirectory = "/home/sgeisenh";
    stateVersion = "22.05";
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "$EDITOR";
    };

    packages = with pkgs; [
      ( python310.withPackages (ps: with ps; [ pip flake8 black ]) )
      cmake
      fd
      gcc
      google-chrome
      luajit
      mypy
      neofetch
      neovim
      nixfmt
      openssl
      poetry
      ripgrep
      ripgrep-all
      rust-analyzer
      rustup
      sqlite
      tree
      tree-sitter
      wget
      zig
    ];
  };

  programs.bat.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fzf.enable = true;

  programs.htop.enable = true;

  programs.jq.enable = true;

  programs.kitty.enable = true;

  xdg.configFile."nvim" = {
    source = programs/neovim;
    recursive = true;
  };
}
