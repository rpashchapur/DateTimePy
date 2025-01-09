# datetime-service/flake.nix
{
  description = "Python DateTime Service Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    let
      forAllSystems = flake-utils.lib.eachDefaultSystem;
    in
    forAllSystems (system:
      let
        pkgs = import nixpkgs { inherit system; };
        datetime-service = pkgs.callPackage ./default.nix {};
      in {
        packages.default = datetime-service;
      }
    ) // {
      nixosModules.default = { pkgs, ... }: {
        systemd.services.datetime-service = {
          description = "Python DateTime Service";
          wantedBy = [ "multi-user.target" ];
          serviceConfig = {
            ExecStart = "${pkgs.python3}/bin/python ${pkgs.datetime-service}/python-service/datetime_service.py";
            Restart = "always";
            User = "root";
          };
        };
      };
    };
}

