# datetime-service/flake.nix
{
  description = "Python DateTime Service Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        packages.default = pkgs.callPackage ./default.nix {};
      }
    ) // {
      nixosModules.default = { config, pkgs, ... }: {
        imports = [ ./service.nix ];
      };
    };
}

