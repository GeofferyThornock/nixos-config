{lib, config, pkgs, ...}:
{
    home.packages = with pkgs; [
        zsh
        gzip
        oh-my-zsh
        ghostty
        qemu
        wl-clipboard
        gnumake
        grub2
    ];

    programs = {
      zsh = {
          enable = true;
          oh-my-zsh = {
              enable = true;
              theme = "geoffgarside";
          };
          syntaxHighlighting.enable = true;
          autosuggestion.enable = true;
          initExtra = ''
                if [ -d "$HOME/.local/bin/scripts" ] ; then
                    PATH="$PATH:$HOME/.local/bin/scripts"
                fi
                if [ -d "$HOME/opt/cross/bin" ] ; then
                    PATH="$PATH:$HOME/opt/cross/bin"
                fi

          '';
          shellAliases = {
              tms = "tmux-sessionizer";
              vim = "nvim";
              ls = "eza -a";
              ll = "ls -l";
              update = "sudo nixos-rebuild switch --flake /home/geoff/nixos";
              nixconf = "sudo vim /home/geoff/nixos";
              hyprconf = "vim /home/geoff/.config/hypr/hyprland.conf";
          };
      };
      ghostty.settings = {
          title = "Terminal";
          theme = "miasma";
          font-size = "20";
          cursor-style = "block";
          confirm-close-surface = "false";
          window-decoration = "false";
      };
    };


}
