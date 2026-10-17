{ pkgs, ...}:
{
    environment.systemPackages = with pkgs; [
        xorg.xhost # start with sudo
    ];

    programs.throne = {
        enable = true;
        tunMode.enable = true;
    };
}
