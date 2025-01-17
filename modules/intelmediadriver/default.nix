{ config, pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.intel-media-driver
  ];
}