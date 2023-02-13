{ config, pkgs, ... }:

{
  imports = (import ./programs);

  home = {
    stateVersion = "22.05";
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "$EDITOR";
    };

    packages = with pkgs; [
      alacritty
      exa
      fd
      flyctl
      httpie
      inetutils
      lsof
      neofetch
      neovim
      nixfmt
      nodejs
      nodePackages.prettier
      nodePackages.pyright
      poetry
      qemu
      rectangle
      ripgrep
      ripgrep-all
      rust-analyzer
      rustup
      sqlite
      tree
      tree-sitter
      wget
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

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  programs.fzf.enable = true;

  programs.htop.enable = true;

  programs.jq.enable = true;

  xdg.configFile."nvim" = {
    source = programs/neovim;
    recursive = true;
  };
}
