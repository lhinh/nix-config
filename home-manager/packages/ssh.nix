{ pkgs, config, ... }:
{
  home-manager.users.slippy.programs.ssh = {
    enable = true;
    package = pkgs.openssh;
    addKeysToAgent = "yes";
    extraConfig = ''
      Host rpi4b
        HostName 192.168.1.142
        User slippy
        IdentityFile ~/.ssh/id_ed25519

      Host discordpi
        HostName 192.168.1.141
        User slippy
        IdentityFile ~/.ssh/id_ed25519
    '';
  };
}
