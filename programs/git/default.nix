{ config, pkgs, ... }:

let
  gitConfig = builtins.readFile ./gitconfig;
in
{
  programs.git = {
    enable = true;
    extraConfig = gitConfig;
  };
}
