{ pkgs, ...}:
{
    environment.systemPackages = with pkgs; [
        xorg.xhost # start with sudo
        nekoray
    ];
}
