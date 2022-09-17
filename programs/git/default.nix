{ config, pkgs, ... }:

let
  gitConfig = builtins.readFile ./gitconfig;
in
{
  programs.git = {
    enable = true;
    userName = "Samuel Eisenhandler";
    userEmail = "sgeisenhandler@gmail.com";
  };
}
