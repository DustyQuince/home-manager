{ config, lib, pkgs, ... }:

{
  programs.bash.enable = true;

  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "history"
        "history-substring-search"
        "ripgrep"
        "thefuck"
        "vi-mode"
        "z"
      ];
      theme = "candy";
    };
  };

  programs.tmux = {
    enable = true;
    shortcut = "a";
    extraConfig = ''
      # Mouse works as expected
      set-option -g mouse on
      # easy-to-remember split pane commands
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
    '';
  };

  home.file.".alacritty.yml".source = ./alacritty.yml;

  home.packages = with pkgs; [ tdrop ];
}
