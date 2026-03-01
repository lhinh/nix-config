{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader (assumes UEFI; adjust if needed).
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable Docker.
  virtualisation.docker.enable = true;
  users.users.slippy.extraGroups = [ "docker" ];

  # Networking
  networking.hostName = "titanx";
  networking.firewall = {
    enable = true;
  };

  # NVIDIA GPU configuration
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };

  # Enable OpenSSH
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

  # Enable Tailscale
  services.tailscale.enable = true;

  # Set default editor to vim.
  environment.variables.EDITOR = "vim";

  # Mount file share (same NAS as other hosts).
  environment.systemPackages = [ pkgs.cifs-utils ];
  fileSystems."/mnt/share" = {
    device = "//192.168.1.210/Tesseract";
    fsType = "cifs";
    options = let
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in [
      "${automount_opts},credentials=/etc/nixos/smb-secrets"
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken.
  system.stateVersion = "24.11";
}

