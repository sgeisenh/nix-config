{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Samuel Eisenhandler";
    userEmail = "sgeisenhandler@gmail.com";
    extraConfig.init.defaultBranch = "main";
  };
}
