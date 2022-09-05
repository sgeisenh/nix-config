{ config, pkgs, ... }:

let
  tmuxConfig = builtins.readFile ./tmux.conf;
in
{
  programs.tmux = {
    enable = true;
    extraConfig = tmuxConfig;
  };
}
