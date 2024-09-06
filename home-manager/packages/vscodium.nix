{ config, pkgs, ... }:
{
  home-manager.users.slippy.programs.vscode = {
      enable = true;
#       package = pkgs.vscodium;
      # Wrap VSCodium with --disable-gpu flag
      package = pkgs.vscodium.overrideAttrs (oldAttrs: {
        postInstall = ''
          wrapProgram $out/bin/codium --add-flags "--disable-gpu"
        '';
      });
      mutableExtensionsDir = false;
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        ms-python.python
        redhat.java
        vscjava.vscode-java-debug
        vscjava.vscode-java-test
        vscjava.vscode-maven
        eg2.vscode-npm-script
        dbaeumer.vscode-eslint
        yzhang.markdown-all-in-one
        svelte.svelte-vscode
      ];
  };
}
