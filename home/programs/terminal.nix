{
  lib,
  pkgs,
  ...
}: {
	home.packages = with pkgs; [
		zsh
		oh-my-zsh
		ghostty
	];
    programs.neovim.plugins = [
        pkgs.vimPlugins.nvim-treesitter.withAllGrammars
    ];
}
