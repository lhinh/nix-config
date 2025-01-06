{ config, pkgs, ... }:
{
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.defaultSession = "plasma";
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
}
