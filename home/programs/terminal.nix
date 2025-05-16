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
}
