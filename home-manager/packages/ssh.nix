{ pkgs, config, ... }:
{
  home-manager.users.slippy.programs.ssh = {
    enable = true;
    package = pkgs.openssh;
    enableDefaultConfig = false;

    matchBlocks = {
      "rpi4b" = {
        hostname = "192.168.1.142";
        user = "slippy";
        identityFile = "~/.ssh/id_ed25519";
        addKeysToAgent = "yes";
      };

      "discordpi" = {
        hostname = "192.168.1.141";
        user = "slippy";
        identityFile = "~/.ssh/id_ed25519";
        addKeysToAgent = "yes";
      };      
    };
  };
}
