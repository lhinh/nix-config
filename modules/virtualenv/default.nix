{ config, pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.virtualenv
  ];
}