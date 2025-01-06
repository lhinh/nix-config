{ config, pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.docker_27
  ];
}