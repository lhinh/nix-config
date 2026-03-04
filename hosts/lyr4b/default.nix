{ config, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  # Raspberry Pi 4 kernel (needed for Pi Cam V2 / IMX219)
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;

  # Optional: if your install uses generic extlinux (common on Pi 4)
  boot.loader.generic-extlinux-compatible.enable = true;

  # Camera: enable in firmware (config.txt). On some setups this is deprecated
  # for Pi 4; if camera doesn’t work, add dtoverlay=imx219 to config.txt manually.
  boot.loader.raspberryPi = {
    enable = true;
    version = 4;
    firmwareConfig = ''
      camera_auto_detect=1
    '';
  };

  # Docker (like lyr00)
  virtualisation.docker.enable = true;
  users.users.slippy.extraGroups = [ "docker" ];

  networking.hostName = "lyr4b";
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 8324 32400 32469 ];
    allowedUDPPortRanges = [
      { from = 4000; to = 4007; }
      { from = 8000; to = 8010; }
      { from = 32410; to = 32414; }
    ];
  };

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      AllowUsers = [ "slippy" ];
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password";
    };
  };

  services.tailscale.enable = true;

  environment.variables.EDITOR = "vim";

  system.stateVersion = "24.11";
}