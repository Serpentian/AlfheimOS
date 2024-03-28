{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        vdirsyncer
    ];

    home.file.".config/vdirsyncer/config".text = ''
[general]
status_path = "~/.local/share/vdirsyncer/status/"

[pair khal_pair_1]
a = "khal_pair_1_local"
b = "khal_pair_1_remote"
# collections = ["from a", "from b"]
collections = null
conflict_resolution = "b wins"

[storage khal_pair_1_local]
type = "filesystem"
path = "/home/serpentian/.local/share/khal/calendars/Work"
fileext = ".ics"

[storage khal_pair_1_remote]
type = "caldav"
url = "https://calendar.mail.ru/principals/vk.team/n.zheleztsov/calendars/61D7C838-8481-4A0E-8781-6EA82C8F1EC3/"
username = "n.zheleztsov@vk.team"
password.fetch = ["command", "cat", "~/.pass/caldav"]
    '';
}
