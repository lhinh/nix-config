{ config, pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.python3
  ];
}