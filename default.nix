{ pkgs ? import <nixpkgs> {} }:

pkgs.python3.pkgs.buildPythonPackage {
  pname = "datetime-service";
  version = "0.1.0";
  src = ./.;
  format = "pyproject"; 
  nativeBuildInputs = [ pkgs.python3.pkgs.setuptools ];
  propagatedBuildInputs = [
    pkgs.python3.pkgs.humanize
    pkgs.python3.pkgs.arrow
  ];
}
