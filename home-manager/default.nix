{ config, pkgs, lib, ... } : {
  imports = [
    ./packages
  ];

  users.users.slippy = {
    isNormalUser = true;
    description = "Loc Hinh";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.slippy.home.stateVersion = "24.05";
}
