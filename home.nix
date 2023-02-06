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
      ( python310.withPackages (ps: with ps; [ pip flake8 black snakeviz neovim ]) )
      clang
      cmake
      fd
      flyctl
      httpie
      inetutils
      kcachegrind
      lsof
      luajit
      mypy
      neofetch
      neovim
      nixfmt
      nodejs
      nodePackages.prettier
      nodePackages.pyright
      openssl
      pkg-config
      poetry
      qemu
      ripgrep
      ripgrep-all
      rust-analyzer
      rustup
      sqlite
      sumneko-lua-language-server
      tree
      tree-sitter
      vagrant
      valgrind
      wget
      zig
    ];
  };

  programs.bash.enable = true;
  programs.bat.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableBashIntegration = true;
  };

  programs.fzf.enable = true;

  programs.htop.enable = true;

  programs.jq.enable = true;

  xdg.configFile."nvim" = {
    source = programs/neovim;
    recursive = true;
  };
}
