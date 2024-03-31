import Cava from "./buttons/Cava"
import Date from "./buttons/Date"
import Launcher from "./buttons/Launcher"
import Media from "./buttons/Media"
import PowerMenu from "./buttons/PowerMenu"
import SysTray from "./buttons/SysTray"
import SystemIndicators from "./buttons/SystemIndicators"
import Taskbar from "./buttons/Taskbar"
import Workspaces from "./buttons/Workspaces"
import Wallpapers from "./buttons/Wallpapers"
import options from "options"

const { start, center, end } = options.bar.layout
const pos = options.bar.position.bind()

export type BarWidget = keyof typeof widget

const widget = {
    cava: Cava,
    date: Date,
    launcher: Launcher,
    media: Media,
    powermenu: PowerMenu,
    systray: SysTray,
    system: SystemIndicators,
    taskbar: Taskbar,
    workspaces: Workspaces,
    wallpapers: Wallpapers,
    expander: () => Widget.Box({ expand: true }),
}

export default (monitor: number) => Widget.Window({
    monitor,
    class_name: "bar",
    name: `bar${monitor}`,
    exclusivity: "exclusive",
    anchor: pos.as(pos => [pos, "right", "left"]),
    child: Widget.CenterBox({
        css: "min-width: 2px; min-height: 2px;",
        startWidget: Widget.Box({
            hexpand: true,
            children: start.bind().as(s => s.map((w, idx) => widget[w](monitor,
                idx === 0 ? "first" : "start"))),
        }),
        centerWidget: Widget.Box({
            hpack: "center",
            children: center.bind().as(c => c.map((w, idx) => widget[w](monitor, "center"))),
        }),
        endWidget: Widget.Box({
            hexpand: true,
            children: end.bind().as(e => e.map((w, idx) => widget[w](monitor,
                idx === e.length - 1 ? "last" : "end"))),
        }),
    }),
})
