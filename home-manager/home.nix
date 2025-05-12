{ config, pkgs, ... }:

#let
#  unstable = import <nixpkgs-unstable> {
#    config.allowUnfree = true;
#  };
#in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "abadi199";
  home.homeDirectory = "/home/abadi199";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    git
    nerdfonts
    zig
    zed-editor
    ghostty
    rofi
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
  };

  programs.neovim = {
    enable = true;
    plugins = [
      #unstable.vimPlugins.astrocore
      #unstable.vimPlugins.astroui
      #unstable.vimPlugins.astrotheme
      #unstable.vimPlugins.astrolsp
    ];
  };

  programs.zsh = {
    enable = true;
    initExtra = ''
      source .p10k.zsh;
    '';

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
    history.size = 10000;
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } # Installations with additional options. For the list of options, please refer to Zplug README.
      ];
    };
  };
}
