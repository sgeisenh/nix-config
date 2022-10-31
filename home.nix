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
      clang
      cmake
      fd
      google-chrome
      inetutils
      luajit
      mypy
      neofetch
      neovim
      nixfmt
      nodePackages.pyright
      openssl
      pkg-config
      poetry
      ripgrep
      ripgrep-all
      rust-analyzer
      rustup
      sqlite
      sumneko-lua-language-server
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

  services.picom = {
    enable = true;
    backend = "glx";
  };

  xdg.configFile."nvim" = {
    source = programs/neovim;
    recursive = true;
  };
}
