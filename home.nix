{ config, pkgs, ... }:

{
  imports = (import ./programs);

  home = {
    stateVersion = "22.05";
    packages = with pkgs; [
      exa
      fd
      flyctl
      httpie
      inetutils
      lsof
      neofetch
      nixfmt
      nodejs
      nodePackages.prettier
      nodePackages.pyright
      poetry
      qemu
      rectangle
      ripgrep
      ripgrep-all
      rnix-lsp
      rust-analyzer
      rustup
      sqlite
      tree
      tree-sitter
      wget
      zoom-us
    ];
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      ls = "exa";
      l = "exa -l";
      la = "exa -la";
      ip = "ip --color=auto";
    };
  };
  programs.bat.enable = true;

  programs.alacritty = {
    enable = true;
    settings.font = {
      family = "JetBrainsMono Nerd Font";
      size = 14;
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  programs.fzf.enable = true;

  programs.htop.enable = true;

  programs.jq.enable = true;
}
