{ config, pkgs, ... }:
{
  imports = [
    ./extensions.nix
  ];

  environment.systemPackages = with pkgs; [
    vscodium
  ];
}
