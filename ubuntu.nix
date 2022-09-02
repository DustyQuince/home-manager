{ pkgs, ... }:

{
  home.file."computing/useful-scripts/new-desktop-ubuntu.sh".source =
    ./new-desktop-ubuntu.sh;
}
