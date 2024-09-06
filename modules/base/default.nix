{ config, pkgs, ... }:
{
  imports = [
    ./core.nix
    ./desktop-core.nix
    ./desktop-kde.nix
    ./packages.nix
  ];
}
