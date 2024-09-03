{ config, pkgs, ... }:

{
  home.file.".config/nemu/nemu.cfg".text = ''
[main]
# virtual machine dir.
vmdir = /home/serpentian/Drives/hdd/nemu

# path to database file.
db = /home/serpentian/.local/share/nemu/nemu.db

# path to pid file. Example:
# pid = /tmp/nemu.pid

# path to debug log file. Example:
# debug_path = /tmp/nemu_debug.log

# override highlight color of running VM's. Example:
# hl_color = 00afd7

# glyph_checkbox = 1
# glyph_separator = 0

# change cursor style for nemu.
# see https://terminalguide.namepad.de/seq/csi_sq_t_space/
# if not set VTE's default cursor style will be used
# cursor_style = 1

err_color = 11111b

[viewer]
# default protocol (1 - spice, 0 - vnc)
spice_default = 1

# vnc client path.
# vnc_bin = /nix/store/xhn0cjcx1wkzvzn5d77gigbpdzfbanzs-tigervnc-1.13.1/bin/vncviewer
vnc_bin = /run/current-system/sw/bin/vncviewer

# vnc client args (%t - title, %p - port)
vnc_args = :%p

# spice client path.
# spice_bin = /nix/store/05wxwgmz9j2lq1xnshg3hfig1djdj36q-virt-viewer-11.0/bin/remote-viewer
spice_bin = /run/current-system/sw/bin/remote-viewer

# spice client args (%t - title, %p - port)
spice_args = --title %t spice://127.0.0.1:%p

# listen for vnc|spice connections (0 - only localhost, 1 - any address)
listen_any = 0

[qemu]
# path to directory, where QEMU binary can be found.
qemu_bin_path = /run/current-system/sw/bin

# comma separated QEMU system targets installed.
targets = x86_64,i386

# Log last QEMU command.
enable_log = 1

# Log path.
log_cmd = /tmp/qemu_last_cmd.log

[nemu-monitor]
# Auto start monitoring daemon
autostart = 1

# Daemon sleep interval (ms) (default: 1000)
#sleep = 1000

# Monitoring daemon pid file
pid = /tmp/nemu-monitor.pid

# Enable D-Bus feature
dbus_enabled = 1

# Message timeout (ms)
dbus_timeout = 2000

# Enable remote control (default: disabled)
#remote_control = 0

# Remote control listen interface (default: any)
#remote_interface = eth0

# Remote control port (default: 20509)
#remote_port = 20509

# Remote control public certificate path
#remote_tls_cert = /path

# Remote control private key path
#remote_tls_key = /path

# Remote control password salt
#remote_salt = salt

# Remote control "password+salt" hash (sha256)
#remote_hash = hash
  '';
}

