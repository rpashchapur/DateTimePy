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
        # Build a Python package for DateTime service
        packages.default = pkgs.python3Packages.buildPythonPackage {
          pname = "datetime-service";
          version = "0.1.0";
          src = ./src/datetime-service-0.1.0.tar.gz;
          format = "setuptools";
          propagatedBuildInputs = [ pkgs.python3Packages.python ];
          doCheck = false;
          installPhase = ''
            mkdir -p $out/bin
            cp main.py $out/bin/datetime-service
            chmod +x $out/bin/datetime-service
          '';
        };

        # Export for use in the main flake
        defaultPackage = self.packages.${system}.default;
      });
}

