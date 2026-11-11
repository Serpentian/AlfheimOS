{pkgs, ...}:
{
    environment.systemPackages = with pkgs; [ nfs-utils ];
    boot.supportedFilesystems = [ "nfs" ];
    services.nfs = {};
    # Mount on access so an unavailable server at boot does not leave the shares unmounted.
    fileSystems."/home/serpentian/Drives/network" = {
        device = "192.168.1.219:/home/serpentian/media";
        fsType = "nfs";
        options = [ "nofail" "x-systemd.automount" "x-systemd.mount-timeout=15s" ];
    };
    fileSystems."/home/serpentian/Drives/networkBig" = {
        device = "192.168.1.219:/home/serpentian/media2";
        fsType = "nfs";
        options = [ "nofail" "x-systemd.automount" "x-systemd.mount-timeout=15s" ];
    };
}
