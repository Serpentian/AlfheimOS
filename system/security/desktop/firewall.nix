{ pkgs, settings, lib, ... }:
{
    networking.firewall = {
        enable = true;
        allowedTCPPortRanges = [
            { from = 1714; to = 1764; } # KDE Connect
        ];
        allowedUDPPortRanges = [
            { from = 1714; to = 1764; } # KDE Connect
        ];

        # allowedUDPPorts = lib.mkIf settings.enableVPN [51820];
        allowedUDPPorts = [
            5900
            5901
            51820
            5173
        ];
        allowedTCPPorts = [
            22     # SSH server
            5900
            5901
            5173
        ];
    };
}
