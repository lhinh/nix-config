{ pkgs, config, lib, ... }:
{
  imports = [
    ./git.nix
    ./vscodium.nix
    ./ssh.nix
    ./packages.nix
  ];
}
