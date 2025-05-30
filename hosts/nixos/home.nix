{ config, inputs, pkgs, ... }:

{
  home.username = "geoff";
  home.homeDirectory = "/home/geoff";


  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  imports = with pkgs; [
        ../../modules/home-manager
  ];
  # This value determines the Home Manager release that your


  within.neovim.enable = true;

  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
