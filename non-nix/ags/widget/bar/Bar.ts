import BatteryBar from "./buttons/BatteryBar"
import Date from "./buttons/Date"
import Launcher from "./buttons/Launcher"
import Media from "./buttons/Media"
import PowerMenu from "./buttons/PowerMenu"
import SysTray from "./buttons/SysTray"
import SystemIndicators from "./buttons/SystemIndicators"
import Taskbar from "./buttons/Taskbar"
import Cava from "./buttons/Cava"
import Submap from "./buttons/Submap"
import Workspaces from "./buttons/Workspaces"
import options from "options"

const { start, center, end } = options.bar.layout
const { transparent, position, curved } = options.bar

export type BarWidget = keyof typeof widget

const widget = {
    battery: BatteryBar,
    date: Date,
    launcher: Launcher,
    media: Media,
    powermenu: PowerMenu,
    systray: SysTray,
    system: SystemIndicators,
    taskbar: Taskbar,
    workspaces: Workspaces,
    cava: Cava,
    submap: Submap,
    expander: () => Widget.Box({ expand: true }),
}

export default (monitor: number) => Widget.Window({
    monitor,
    class_name: "bar",
    name: `bar${monitor}`,
    exclusivity: "exclusive",
    anchor: position.bind().as(pos => [pos, "right", "left"]),
    child: Widget.CenterBox({
        css: "min-width: 2px; min-height: 2px;",
        startWidget: Widget.Box({
            hexpand: true,
            children: start.bind().as(s => s.map((w, idx) =>
                widget[w](curved.value ? (idx == 0 ? "first" : "start") : null))),
        }),
        centerWidget: Widget.Box({
            hpack: "center",
            children: center.bind().as(c => c.map((w, idx) =>
                widget[w](curved.value ? ("center") : null))),
        }),
        endWidget: Widget.Box({
            hexpand: true,
            children: end.bind().as(e => e.map((w, idx) =>
                widget[w](curved.value ? (idx == e.length - 1 ? "last" : "end") : null))),
        }),
    }),
    setup: self => self.hook(transparent, () => {
        self.toggleClassName("transparent", transparent.value)
    }),
})
