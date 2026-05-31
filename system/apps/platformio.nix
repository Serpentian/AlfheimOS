{pkgs, ...}:
{
    services.udev.packages = with pkgs; [
        platformio-core.udev
        openocd
    ];
}
