# default.nix
{ pkgs, lib, ... }: let

datetime-service = pkgs.python3Packages.buildPythonPackage rec {
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

  meta = with pkgs.lib; {
    description = "Python DateTime Service";
    platforms = platforms.all;
  };
};

in
{
  config = {
    environment.systemPackages = with pkgs; [ datetime-service ];

    systemd.services.datetime-service = {
      enable = true;
      description = "Python DateTime Printing Service";
      wantedBy = [ "default.target" ];
      serviceConfig = {
        ExecStart = "${datetime-service}/bin/datetime-service";
        Restart = "always";
        User = "root";
        Group = "root";
      };
    };
  };
}

