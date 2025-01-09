{ pkgs, datetime-service, ... }:

{
  systemd.services.datetime-service = {
    description = "Python DateTime Service";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.python3}/bin/python ${datetime-service}/python-service/datetime_service.py";
      Restart = "always";
      User = "root";
    };
  };
}
