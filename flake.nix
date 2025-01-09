{
  description = "Datetime Service Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = { self, nixpkgs, ... }: 
  let 
    systems = [ "x86_64-linux" "aarch64-linux" ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages = forAllSystems (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        default = pkgs.python3.pkgs.buildPythonPackage {
          pname = "datetime-service";
          version = "0.1.0";
          src = ./.;
          format = "pyproject";
          nativeBuildInputs = [ pkgs.python3.pkgs.setuptools ];
          propagatedBuildInputs = [];
        };
      }
    );

    defaultPackage = forAllSystems (system: self.packages.${system}.default);

    apps = forAllSystems (system: {
      default = {
        type = "app";
        program = "${self.packages.${system}.default}/bin/datetime-service";
      };
    });

    nixosModules.datetime-service = { config, pkgs, ... }: {
      systemd.services."datetime-service" = import ./systemd/datetime-service.nix {
        self = self;
        pkgs = pkgs;
      };
    };
  };
}
