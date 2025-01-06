{
  description = "slippy's NixOS configuration";

  inputs = {
    nixpkgs-unstable.url = "github:NixOS/nixpkgs";
    home-manager-unstable.url = "github:nix-community/home-manager";
    home-manager-unstable.inputs.nixpkgs.follows = "nixpkgs";

    nixpkgs-2405.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager-2405.url = "github:nix-community/home-manager/release-24.05";
    home-manager-2405.inputs.nixpkgs.follows = "nixpkgs-2405";

    nixpkgs-2411.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager-2411.url = "github:nix-community/home-manager/release-24.11";
    home-manager-2411.inputs.nixpkgs.follows = "nixpkgs-2411";
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations = {
      lyr00 = inputs.nixpkgs-2411.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/lyr00

          (import "${inputs.home-manager-2411}/nixos")
          (import ./home-manager/lyr00.nix {stateVersion = "24.11";})

          ./modules/base
          ./modules/firefox
          ./modules/gimp
          ./modules/kgpg
          ./modules/parsec
          ./modules/docker
          ./modules/vscodium
        ];
      };

      vmslippy = inputs.nixpkgs-2405.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/vmslippy

          (import "${inputs.home-manager-2405}/nixos")
          (import ./home-manager {stateVersion = "24.05";})

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
