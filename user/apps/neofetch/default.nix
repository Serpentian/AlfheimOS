
{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    neofetch
  ];

  home.file.".config/neofetch/config.conf".text = ''
      print_info() {
        prin ""
        prin ""
        prin ""

        info title
        info underline
        info "OS" distro
        info "Kernel" kernel
        info "Uptime" uptime
        info "Disk" disk
    }

    # Title
    # Hide/Show Fully qualified domain name.
    title_fqdn="off"

    # Distro
    # Shorten the output of the distro function
    distro_shorthand="tiny"
    # Show/Hide OS Architecture.
    os_arch="off"

    # Uptime
    # Shorten the output of the uptime function
    uptime_shorthand="on"

    # Disk
    # Which disks to display.
    disk_show=('/')
    # Disk subtitle.
    disk_subtitle="mount"
    # Disk percent.
    disk_percent="off"

    # Text Colors
    colors=(distro)

    # Text Options
    # Toggle bold text
    bold="on"
    # Enable/Disable Underline
    underline_enabled="on"
    # Underline character
    underline_char="-"

    # Info Separator
    separator="\t"

    # Image backend.
    image_backend="ascii"
    # Image Source
    image_source="auto"

    # Gap between image and text
    gap=3
  '';
}
