{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.within.neovim;
in
{
  options.within.neovim.enable = mkEnableOption "Enables Within's Neovim config";

  config = mkIf cfg.enable {
    programs.neovim.enable = true;
    programs.neovim.viAlias = true;
    programs.neovim.vimAlias = true;
    programs.neovim.vimdiffAlias = true;
    programs.neovim.plugins = [
      pkgs.vimPlugins.nvim-treesitter
      # (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
      #   p.c
      #   p.lua
      #   p.nix
      #   p.go
      #   p.python
      #   p.regex
      #   p.bash
      #   p.markdown
      #   p.markdown_inline
      # ]))
    ];
    programs.neovim.extraPackages = [
      pkgs.tree-sitter
      pkgs.lua54Packages.jsregexp
      pkgs.tree-sitter-grammars.tree-sitter-lua
      pkgs.tree-sitter-grammars.tree-sitter-nix
      pkgs.tree-sitter-grammars.tree-sitter-go
      pkgs.tree-sitter-grammars.tree-sitter-bash
      pkgs.tree-sitter-grammars.tree-sitter-regex
      pkgs.tree-sitter-grammars.tree-sitter-markdown

      pkgs.fzf
      # pkgs.magick
      pkgs.lua-language-server
      # pkgs.nil
      pkgs.nixd
      pkgs.go
      pkgs.stylua
      pkgs.cargo
    ];
    home.file = {
      ".config/nvim" = {
        source = /home/geoff/.config/nvim;
        recursive = true;
      };
    };
    # Conditionally add xdg.desktopEntries for Linux
    xdg.desktopEntries = lib.optionalAttrs pkgs.stdenv.isLinux {
      neovim = {
        name = "Neovim";
        genericName = "editor";
        exec = "nvim -f %F";
        mimeType = [
          "text/html"
          "text/xml"
          "text/plain"
          "text/english"
          "text/x-makefile"
          "text/x-c++hdr"
          "text/x-tex"
          "application/x-shellscript"
        ];
        terminal = false;
        type = "Application";
      };
    };
  };
}
