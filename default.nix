# datetime-service/default.nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.python3Packages.buildPythonPackage {
  pname = "datetime-service";
  version = "0.1.0";
  src = ./.;
  doCheck = false;
  propagatedBuildInputs = [ ];
  buildPhase = ''
    cp -r python-service $out
  '';
}

