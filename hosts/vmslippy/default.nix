{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Using proper kernel modules for vm.
  boot.kernelModules = [ 
    "vmw_balloon"
    "vmwgfx"
    "vsock"
  ];

  networking.hostName = "vmslippy";

  # Install VMtools
  virtualisation.vmware.guest.enable = true;

  # Enable Docker daemon
  virtualisation.docker.enable = true;


  # Use vmware video driver.
  services.xserver.videoDrivers = [ "vmware" ];

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "slippy";

  # Set default editor to vim.
  environment.variables.EDITOR = "vim";

  # Mount file share
  environment.systemPackages = [ pkgs.cifs-utils ];
  fileSystems."/mnt/Tesseract" = {
    device = "//192.168.1.210/Tesseract";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

    in ["${automount_opts},credentials=/etc/nixos/smb-secrets,uid=1000,gid=100"];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
