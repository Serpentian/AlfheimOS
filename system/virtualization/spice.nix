{pkgs, ...}:
{
    virtualisation.spiceUSBRedirection.enable = true;
    # services.spice-vdagentd.enable = true;
    environment.systemPackages = with pkgs; [
        spice-gtk
    ];
}
