{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # shell
    nodePackages.bash-language-server

    # go
    go_1_19
    gopls

    # nix
    nixfmt
  ];
}
