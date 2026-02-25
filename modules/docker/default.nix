{ config, pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.docker_28
  ];
}