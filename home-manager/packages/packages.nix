{ config, pkgs, ... }:
{
  home-manager.users.slippy.home.packages = with pkgs; [
    discord
  ];
}
