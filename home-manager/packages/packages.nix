{ config, pkgs, ... }:
{
  home-manager.users.slippy.home.packages = with pkgs; [
    (discord.overrideAttrs (oldAttrs: {
        postInstall = ''
          wrapProgram $out/bin/discord --add-flags "--use-gl=desktop"
        '';
      }))
  ];
}
