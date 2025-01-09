{
  description = "Datetime Service Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = { self, nixpkgs, ... }: {
    packages = nixpkgs.lib.genAttrs [ "x86_64-linux" ] (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in pkgs.python3.pkgs.buildPythonPackage {
        pname = "datetime-service";
        version = "0.1.0";
        src = ./.;
        buildInputs = [ pkgs.python3 ];
        propagatedBuildInputs = [];
      }
    );

    nixosModules.datetime-service = { config, pkgs, ... }: {
      systemd.services."datetime-service" = {
        description = "Datetime Service";
        after = [ "network.target" ];
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
          ExecStart = "${pkgs.python3}/bin/python3 ${./datetime_service/main.py}";
          Restart = "always";
          RestartSec = "5s";
        };
      };
    };
  };
}
