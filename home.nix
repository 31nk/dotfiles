{ config, pkgs, ... }:

{
  home.username = "dorian";
  home.homeDirectory = "/home/dorian";
  home.stateVersion = "25.05";

  home.packages = [
    pkgs.hyprland
    pkgs.neovim
    pkgs.waybar
    pkgs.swaynotificationcenter
    pkgs.foot
    pkgs.wofi
    pkgs.fzf
    pkgs.fish  # Add fish package
  ];

  home.file = {
    ".config/hypr".source = ~/dotfiles/hypr;
    ".config/nvim".source = ~/dotfiles/nvim;
    ".config/waybar".source = ~/dotfiles/waybar;
    ".config/swaync".source = ~/dotfiles/swaync;
    ".config/foot".source = ~/dotfiles/foot;
    ".config/wofi".source = ~/dotfiles/wofi;
  };

  home.sessionVariables = {};
  programs.home-manager.enable = true;

  # Fish shell configuration
  programs.fish = {
    enable = true;
    package = pkgs.fish;  # Explicitly enable the Fish package
  };

  home.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config/#nixos";
    upgrade="sudo nixos-rebuild switch --upgrade --flake ~/nixos-config/#nixos";
    
  };
}

