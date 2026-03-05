{ config, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  # Raspberry Pi 4 kernel (needed for Pi Cam V2 / IMX219)
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;

  # Optional: if your install uses generic extlinux (common on Pi 4)
  #boot.loader.generic-extlinux-compatible.enable = true;
  hardware = {
    raspberry-pi."4".apply-overlays-dtmerge.enable = true;
    deviceTree = {
      enable = true;
      filter = "*rpi-4-*.dtb";
    };
  };
  console.enable = false;
  environment.systemPackages = with pkgs; [
    libraspberrypi
    raspberrypi-eeprom
  ];
  # Bluetooth
  systemd.services.btattach = {
    before = [ "bluetooth.service" ];
    after = [ "dev-ttyAMA0.device" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.bluez}/bin/btattach -B /dev/ttyAMA0 -P bcm -S 3000000";
    };
  };


  # Docker (like lyr00)
  virtualisation.docker.enable = true;

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

  services.tailscale.enable = true;

  environment.variables.EDITOR = "vim";

  system.stateVersion = "24.11";
}