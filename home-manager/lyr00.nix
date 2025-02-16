{stateVersion} : { config, pkgs, lib, ... } : {
  imports = [
    ./packages/git.nix
    ./packages/ssh.nix
  ];

  users.users.slippy = {
    isNormalUser = true;
    description = "Loc Hinh";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.slippy.home.stateVersion = stateVersion;
}
