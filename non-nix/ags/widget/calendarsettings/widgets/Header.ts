import icons from "lib/icons"
import { clock, uptime } from "lib/variables"
import options from "options"
import powermenu, { Action } from "service/powermenu"

function up(up: number) {
    const h = Math.floor(up / 60)
    const m = Math.floor(up % 60)
    return `${h}h ${m < 10 ? "0" + m : m}m`
}

const Clock = () => Widget.Box({
    class_name: "clock-box",
    vertical: true,
    children: [
        Widget.Label({
            class_name: "clock",
            label: clock.bind().as(t => t.format("%H:%M")!),
        }),
    ],
})

const SysButton = (action: Action) => Widget.Button({
    vpack: "center",
    child: Widget.Icon(icons.powermenu[action]),
    on_clicked: () => powermenu.action(action),
})

export const Header = () => Widget.Box(
    { class_name: "header horizontal" },
    Clock(),
    Widget.Box({ hexpand: true }),
    Widget.Button({
        vpack: "center",
        child: Widget.Icon(icons.ui.settings),
        on_clicked: () => {
            App.closeWindow("calendarsettings")
            App.closeWindow("settings-dialog")
            App.openWindow("settings-dialog")
        },
    }),
    SysButton("logout"),
    Widget.Button({
        vpack: "center",
        child: Widget.Icon(icons.powermenu["shutdown"]),
        on_clicked: () => App.toggleWindow("powermenu")
    }),
    // SysButton("shutdown"),
)
