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
    tmux
    nnn
    neofetch
    cmatrix
    eza
    spotify

    # package managers
    yarn
  ];


}
