{
  lib,
  pkgs,
  ...
}: {

    home.packages = with pkgs; [
      go
      cargo
      python314
      dotnet-runtime
      gcc
      binutils
      libgcc
    ];
}
