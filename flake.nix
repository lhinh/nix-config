{
  description = "slippy's NixOS configuration";

  inputs = {
    raspberry-pi-nix.url = "github:nix-community/raspberry-pi-nix";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs";
    home-manager-unstable.url = "github:nix-community/home-manager";
    home-manager-unstable.inputs.nixpkgs.follows = "nixpkgs";

    nixpkgs-2405.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager-2405.url = "github:nix-community/home-manager/release-24.05";
    home-manager-2405.inputs.nixpkgs.follows = "nixpkgs-2405";

    nixpkgs-2411.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager-2411.url = "github:nix-community/home-manager/release-24.11";
    home-manager-2411.inputs.nixpkgs.follows = "nixpkgs-2411";

    nixpkgs-2511.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager-2511.url = "github:nix-community/home-manager/release-25.11";
    home-manager-2511.inputs.nixpkgs.follows = "nixpkgs-2511";
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations = {
      lyr00 = inputs.nixpkgs-2511.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/lyr00

          (import "${inputs.home-manager-2511}/nixos")
          (import ./home-manager/lyr00.nix {stateVersion = "24.11";})

          ./modules/base
          ./modules/firefox
          ./modules/gimp
          ./modules/gpg
          ./modules/intelmediadriver
          ./modules/krdp
          ./modules/parsec
          ./modules/docker
          ./modules/vscodium
        ];
      };

      vmslippy = inputs.nixpkgs-2511.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/vmslippy

          (import "${inputs.home-manager-2511}/nixos")
          (import ./home-manager {stateVersion = "24.11";})

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
          ./modules/discord
          ./modules/python3
          ./modules/virtualenv
        ];
      };

      titanx = inputs.nixpkgs-2511.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/titanx

          (import "${inputs.home-manager-2511}/nixos")
          (import ./home-manager {stateVersion = "24.11";})

          ./modules/base
          ./modules/firefox
          ./modules/gimp
          ./modules/gpg
          ./modules/libreoffice
          ./modules/java
          ./modules/maven
          ./modules/node
          ./modules/svelte
          ./modules/code-cursor
          ./modules/docker
          ./modules/discord
          ./modules/python3
          ./modules/virtualenv
          ./modules/vscodium
        ];
      };

      lyr4b = inputs.nixpkgs-2511.lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/lyr4b
          (import "${inputs.home-manager-2511}/nixos")
          (import ./home-manager/lyr4b.nix { stateVersion = "24.11"; })
          ./modules/base
          ./modules/rpicam-apps
          # Apply raspberry-pi-nix libcamera overlay so pkgs has libcamera-apps (rpicam-apps)
          ({ config, inputs, ... }: {
            nixpkgs.overlays = [ inputs.raspberry-pi-nix.overlays.libcamera ];
          })
        ];
      };
    };
  };
}

