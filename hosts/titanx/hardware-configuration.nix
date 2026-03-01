# Placeholder hardware configuration for the titanx host.
# On the actual machine, generate a real version with:
#   nixos-generate-config --show-hardware-config > /etc/nixos/hardware-configuration.nix
# and then copy it into this repository at hosts/titanx/hardware-configuration.nix.

{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  # TODO: Replace this with the real root filesystem from the generated config.
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/REPLACE-ME";
    fsType = "ext4";
  };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface.
  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

