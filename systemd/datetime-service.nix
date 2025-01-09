{ self, pkgs, ... }: {
  enable = true;
  description = "Datetime Service";
  after = [ "network.target" ];
  wantedBy = [ "multi-user.target" ];
  serviceConfig = {
    ExecStart = "${self.packages.${pkgs.system}.default}/bin/datetime-service";
    Restart = "always";
    RestartSec = "5s";
    User = "root";
    Environment = "PATH=/run/current-system/sw/bin:${self.packages.${pkgs.system}.default}/bin:${pkgs.gnugrep}/bin:${pkgs.coreutils}/bin:${pkgs.util-linux}/bin:$PATH";
    StandardOutput = "journal";
    StandardError = "journal";
  };
}
