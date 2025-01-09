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
        packages.default = pkgs.python3Packages.buildPythonPackage {
          pname = "datetime-service";
          version = "0.1.0";
          src = ./.;
          format = "setuptools";
          propagatedBuildInputs = [ pkgs.python3Packages.python ];
          doCheck = false;
        };
      });
}
