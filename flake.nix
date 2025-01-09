# datetime-service/flake.nix
{
  description = "Python DateTime Service";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs }:
    let
      forAllSystems = system: let
        pkgs = import nixpkgs { inherit system; };
        datetime-service = pkgs.callPackage ./default.nix {};
      in {
        packages.default = datetime-service;
        nixosModules.default = { pkgs, ... }: {
          imports = [ ./service.nix ];
          specialArgs = { inherit datetime-service; };
        };
      };
    in
    forAllSystems;
}

