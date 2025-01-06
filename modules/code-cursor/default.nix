{ config, inputs, pkgsUnstable, pkgs, ... }:
{
    # this allows you to access `pkgsUnstable` anywhere in your config
    _module.args.pkgsUnstable = import inputs.nixpkgs-unstable {
        inherit (pkgs.stdenv.hostPlatform) system;
        inherit (config.nixpkgs) config;
    };
    environment.systemPackages = [
        pkgsUnstable.code-cursor
    ];
}