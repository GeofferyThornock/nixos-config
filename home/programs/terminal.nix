{
  lib,
  pkgs,
  ...
}: {
	home.packages = with pkgs; [
		zsh
        wezterm
		oh-my-zsh
		ghostty
	];
}
