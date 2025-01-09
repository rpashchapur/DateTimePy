{ self, pkgs, ... }: {
  description = "Datetime Service";
  after = [ "network.target" ];
  wantedBy = [ "multi-user.target" ];
  serviceConfig = {
    ExecStart = "${pkgs.python3}/bin/python3 ${self.packages.x86_64-linux.default}/datetime_service/main.py";
    Restart = "always";
    RestartSec = "5s";
  };
}
