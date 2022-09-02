{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vlc
    gimp
    digikam
    blender
    super-slicer
    freecad
    openscad
    kiwix
    inkscape-with-extensions
    okular
    libreoffice
    hugo
    yt-dlp
  ];
}
