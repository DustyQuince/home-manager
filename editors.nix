{ pkgs, ... }:

{
  home.file.".doom.d/init.el".source = ./doom/init.el;
  home.file.".doom.d/config.el".source = ./doom/config.el;
  home.file.".doom.d/packages.el".source = ./doom/packages.el;
  home.file."elfeed.org".source = ./doom/elfeed.org;

  home.packages = with pkgs; [ atom emacs graphviz neovim vim ];
}
