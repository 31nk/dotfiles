{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "dorian";
  home.homeDirectory = "/home/dorian";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.hyprland
    pkgs.neovim
    pkgs.waybar
    pkgs.swaynotificationcenter
    pkgs.foot
    pkgs.wofi
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/hypr".source = ~/dotfiles/hypr;
    ".config/nvim".source = ~/dotfiles/nvim;
    ".config/waybar".source = ~/dotfiles/waybar;
    ".config/swaync".source = ~/dotfiles/swaync;
    ".config/foot".source = ~/dotfiles/foot;
    ".config/wofi".source = ~/dotfiles/wofi;
  };

  # You can also set the file content immediately.
  # ".gradle/gradle.properties".text = ''
  #   org.gradle.console=verbose
  #   org.gradle.daemon.idletimeout=3600000
  # '';

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Zsh and oh-my-zsh configuration
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
    };
  };
}

