{ pkgs ? import <nixpkgs> {} }:

pkgs.python3Packages.buildPythonPackage {
  pname = "datetime-service";
  version = "0.1.0";
  src = ./.;
  propagatedBuildInputs = [ pkgs.python3Packages.python ];
  format = "setuptools";
  doCheck = false;
}
