{ config, pkgs, ... }:

{
  imports = (import ./programs);

  nixpkgs.config.allowUnfree = true;

  home = {
    stateVersion = "22.05";
    packages =
      with pkgs; let
        darwinPkgs = if pkgs.system == "aarch64-darwin" then [ rectangle ] else [ ];
        x86Pkgs = if pkgs.system == "x86_64-linux" then [ zulip ] else [ ];
      in
      [
        cmake
        exa
        fd
        flyctl
        gcc
        httpie
        inetutils
        lsof
        neofetch
        ninja
        nixfmt
        nodejs
        nodePackages.prettier
        nodePackages.pyright
        poetry
        qemu
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
      ] ++ darwinPkgs ++ x86Pkgs;
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
    initExtra = ''
      export PATH="$HOME/.cargo/bin:$PATH"
    '';
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

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.htop.enable = true;

  programs.jq.enable = true;

  programs.home-manager.enable = true;
}
