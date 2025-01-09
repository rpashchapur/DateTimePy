{ pkgs ? import <nixpkgs> {} }:

pkgs.python3.pkgs.buildPythonPackage {
  pname = "datetime-service";
  version = "0.1.0";
  src = ./.;
  format = "pyproject"; # Ensure pyproject.toml usage
  nativeBuildInputs = [ pkgs.python3.pkgs.setuptools ];
  propagatedBuildInputs = [];
}
