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
      luajit
      mypy
      neofetch
      neovim
      nixfmt
      openssl
      poetry
      ripgrep
      ripgrep-all
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

  xdg.configFile."nvim/init.lua".source = programs/neovim/init.lua;
  xdg.configFile."nvim/lua/plugins.lua".source = programs/neovim/lua/plugins.lua;
  xdg.configFile."nvim/lua/mappings.lua".source = programs/neovim/lua/mappings.lua;
  xdg.configFile."nvim/lua/options.lua".source = programs/neovim/lua/options.lua;
  xdg.configFile."nvim/lua/config/cmp.lua".source = programs/neovim/lua/config/cmp.lua;
  xdg.configFile."nvim/lua/config/lsp.lua".source = programs/neovim/lua/config/lsp.lua;
  xdg.configFile."nvim/lua/config/rust-tools.lua".source = programs/neovim/lua/config/rust-tools.lua;
  xdg.configFile."nvim/lua/config/treesitter.lua".source = programs/neovim/lua/config/treesitter.lua;
}
