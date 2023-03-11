{ config, pkgs, ... }:

{
  imports = (import ./programs);

  home = {
    stateVersion = "22.05";
    username = "sgeisenh";
    homeDirectory = "/home/sgeisenh";
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

  programs.home-manager.enable = true;
}
