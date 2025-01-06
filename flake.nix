{
  description = "slippy's NixOS configuration";

  inputs = {
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-2405.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager-2405.url = "github:nix-community/home-manager/release-24.05";
    home-manager-2405.inputs.nixpkgs.follows = "nixpkgs-2405";
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations = {
      vmslippy = inputs.nixpkgs-2405.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/vmslippy

          (import "${inputs.home-manager-2405}/nixos")
          ./home-manager

          ./modules/base
          ./modules/firefox
          ./modules/gimp
          ./modules/kate
          ./modules/libreoffice
          ./modules/java
          ./modules/maven
          ./modules/node
          ./modules/svelte
          ./modules/code-cursor
          ./modules/docker
          ./modules/python3
          ./modules/virtualenv
        ];
      };
    };
  };
}
