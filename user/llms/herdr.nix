{ config, pkgs, inputs, ... }:
let
    collie = inputs.collie.packages.${pkgs.stdenv.hostPlatform.system}.collie;
    collieRoot = "${collie}/lib/collie";
    configDir = "${config.xdg.configHome}/collie";
in
{
    home.packages = [
        pkgs.herdr
        collie
    ];

    systemd.user.services.collie = {
        Unit = {
            Description = "Collie";
            StartLimitIntervalSec = 0;
        };
        Service = {
            Type = "simple";
            WorkingDirectory = collieRoot;
            ExecStart = "${collie}/bin/collie _exec-bridge";
            Restart = "on-failure";
            RestartSec = 5;
            NoNewPrivileges = true;
            PrivateTmp = true;
            Environment = [
                "HERDR_SOCKET_PATH=${config.xdg.configHome}/herdr/herdr.sock"
                "COLLIE_PORT=8787"
                "HERDR_PLUGIN_CONFIG_DIR=${configDir}"
                "COLLIE_PLUGIN_ROOT=${collieRoot}"
                "PATH=${config.home.profileDirectory}/bin:/run/current-system/sw/bin"
            ];
            EnvironmentFile = "-${configDir}/.env";
        };
        Install.WantedBy = [ "default.target" ];
    };
}
