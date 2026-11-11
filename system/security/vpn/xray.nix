{ pkgs, ...}:
{
    environment.systemPackages = with pkgs; [
        xhost # start with sudo
    ];

    programs.throne = {
        enable = true;
        tunMode.enable = true;
    };
}
