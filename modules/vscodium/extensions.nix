{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = with vscode-extensions; [
        ms-python.python
        redhat.java
        vscjava.vscode-java-debug
        vscjava.vscode-java-test
        vscjava.vscode-maven
        eg2.vscode-npm-script
        dbaeumer.vscode-eslint
        yzhang.markdown-all-in-one
        svelte.svelte-vscode
        bbenoist.nix
      ];
    })
  ];
}
