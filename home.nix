{ pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "dustyquince";
  home.homeDirectory = "/home/dustyquince";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Dusty Quince";
    userEmail = "dustyquince@protonmail.com";
    extraConfig = {
      mergetool.vimdiff = true;
      pull.rebase = true;
      init.defaultBranch = "main";
    };
  };

  home.sessionVariables = {
    XDG_DATA_DIRS =
      "/usr/share/ubuntu:/usr/share/gnome:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop:$HOME/.nix-profile/share";
    EDITOR = "nvim";
  };
}
