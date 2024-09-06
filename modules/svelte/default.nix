{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nodePackages_latest.svelte-language-server
  ];
}
