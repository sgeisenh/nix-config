{ config, pkgs, lib, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    package = pkgs.neovim-nightly;

    extraLuaConfig = builtins.concatStringsSep "\n" [
      (lib.strings.fileContents ./mappings.lua)
      (lib.strings.fileContents ./options.lua)
      (lib.strings.fileContents ./cmp.lua)
      (lib.strings.fileContents ./lsp.lua)
      (lib.strings.fileContents ./rust-tools.lua)
      (lib.strings.fileContents ./null-ls.lua)
    ];

    extraPackages = with pkgs; [
      tree-sitter

      nodePackages.typescript
      nodePackages.typescript-language-server
      nodePackages.pyright
    ];

    plugins = with pkgs.vimPlugins; [
      plenary-nvim
      telescope-nvim
      telescope-fzf-native-nvim
      rust-tools-nvim
      nvim-lspconfig
      gruvbox-nvim
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-cmdline
      nvim-treesitter
      null-ls-nvim
      copilot-vim
      luasnip
      cmp_luasnip
    ];
  };
}
