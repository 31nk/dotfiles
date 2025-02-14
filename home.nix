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
    pkgs.fish      # Add Fish package
    pkgs.starship  # Add Starship package
  ];

  home.file = {
    ".config/hypr".source = ~/dotfiles/hypr;
    ".config/nvim".source = ~/dotfiles/nvim;
    ".config/waybar".source = ~/dotfiles/waybar;
    ".config/swaync".source = ~/dotfiles/swaync;
    ".config/foot".source = ~/dotfiles/foot;
    ".config/wofi".source = ~/dotfiles/wofi;

    # Create a file in Fish's conf.d to initialize Starship.
    ".config/fish/conf.d/starship.fish".text = ''
      starship init fish | source
    '';

    # Symlink Starship configuration from your dotfiles.
    ".config/starship.toml".source = ~/dotfiles/starship.toml;
  };

  home.sessionVariables = {};
  programs.home-manager.enable = true;

  # Fish shell configuration.
  programs.fish = {
    enable = true;
    package = pkgs.fish;
    shellAliases = {
      rebuild    = "sudo nixos-rebuild switch --flake ~/nixos-config/#nixos";
      upgrade    = "sudo nixos-rebuild switch --upgrade --flake ~/nixos-config/#nixos";
      clearcache = "fc-cache -f -v";
      home       = "home-manager switch";
    };
  };
}
