# datetime-service/default.nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.python3Packages.buildPythonPackage {
  pname = "datetime-service";
  version = "0.1.0";
  src = ./.;
  format = "other";  # Prevents setuptools from being expected
  propagatedBuildInputs = [ ];
  doCheck = false;
  buildPhase = ''
    echo "Skipping build phase, as no build tools are used"
  '';
  installPhase = ''
    mkdir -p $out/python-service
    cp -r python-service/datetime_service.py $out/python-service/
  '';
}

