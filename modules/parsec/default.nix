{ config, pkgs, ... }:
{
  environment.systemPackages = [
      pkgs.parsec-bin
  ];
}
