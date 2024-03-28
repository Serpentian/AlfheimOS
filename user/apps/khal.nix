{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    khal
  ];

  home.file.".config/khal/config".text = ''
[calendars]

[[local]]
path = ${config.home.homeDirectory}/.local/share/khal/calendars/Local
type = calendar

[[work]]
path = ${config.home.homeDirectory}/.local/share/khal/calendars/Work
type = calendar
readonly = True

[locale]
timeformat = %H:%M
dateformat = %d/%m/%Y
longdateformat = %d/%m/%Y
datetimeformat = %d/%m/%Y %H:%M
longdatetimeformat = %d/%m/%Y %H:%M

[default]
default_calendar = local
  '';
}
