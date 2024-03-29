import "lib/session"
import "lib/init"
import "style/style"
import options from "options"
import Bar from "widget/bar/Bar"
import Launcher from "widget/launcher/Launcher"
import NotificationPopups from "widget/notifications/NotificationPopups"
import OSD from "widget/osd/OSD"
import Overview from "widget/overview/Overview"
import PowerMenu from "widget/powermenu/PowerMenu"
import ScreenCorners from "widget/bar/ScreenCorners"
import SettingsDialog from "widget/settings/SettingsDialog"
import Verification from "widget/powermenu/Verification"
import { forMonitors } from "lib/utils"
import { setupQuickSettings } from "widget/quicksettings/QuickSettings"
import { setupCalendarSettings } from "widget/calendarsettings/CalendarSettings"
import hyprland from "lib/hyprland"

App.config({
    onConfigParsed: () => {
        setupQuickSettings()
        setupCalendarSettings()
        hyprland()
    },
    closeWindowDelay: {
        "launcher": options.transition.value,
        "overview": options.transition.value,
        "quicksettings": options.transition.value,
        "calendarsettings": options.transition.value,
    },
    windows: () => [
        ...forMonitors(Bar),
        ...forMonitors(NotificationPopups),
        ...forMonitors(ScreenCorners),
        ...forMonitors(OSD),
        Launcher(),
        Overview(),
        PowerMenu(),
        SettingsDialog(),
        Verification(),
    ],
})
