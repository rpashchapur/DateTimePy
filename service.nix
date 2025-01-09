# datetime-service/service.nix
{ pkgs, ... }:

{
  systemd.services.datetime-service = {
    description = "Python DateTime Service";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.python3}/bin/python ${pkgs.datetime-service}/python-service/datetime_service.py";
      Restart = "always";
      User = "root";
    };
  };
}

