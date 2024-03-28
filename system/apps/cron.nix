{ config, pkgs, ... }:
{
    services.cron = {
        enable = true;
        systemCronJobs = [
            "0 */8 * * * /nix/store/xxjgmaczgd97pn0x3lc0y6kd1ri4i2v3-python3.11-vdirsyncer-0.19.2/bin/vdirsyncer sync"
        ];
    };
}
