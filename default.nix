{ pkgs ? import <nixpkgs> {} }:

pkgs.python3Packages.buildPythonPackage {
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
}

