{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip

    # utils
    ripgrep
    wget
    git
    lshw

    # misc
    wineWowPackages.wayland
    xdg-utils
    fzf
    ripgrep

    # terminal
    neovim
    tmux
    nnn
    neofetch
    cmatrix
    eza
    tofi
    foot

    obsidian

    # package managers
    nodejs
    yarn
  ];


}
