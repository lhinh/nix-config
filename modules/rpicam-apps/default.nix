{ config, pkgs, ... }:
{
  # Raspberry Pi camera apps (rpicam-apps) from nix-community/raspberry-pi-nix overlay.
  # Requires nixpkgs.overlays = [ inputs.raspberry-pi-nix.overlays.libcamera ] for lyr4b.
  environment.systemPackages = with pkgs; [
    libcamera-apps   # rpicam-still, rpicam-vid, rpicam-hello, etc.
    libcamera
    v4l-utils
  ];
}