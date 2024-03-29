import type Gtk from "gi://Gtk?version=3.0"
import { Header } from "./widgets/Header"
import PopupWindow from "widget/PopupWindow"
import options from "options"

const { bar, calendarsettings } = options
const layout = Utils.derive([bar.position, calendarsettings.position], (bar, qs) =>
    `${bar}-${qs}` as const,
)

const Row = (
    toggles: Array<() => Gtk.Widget> = [],
    menus: Array<() => Gtk.Widget> = [],
) => Widget.Box({
    vertical: true,
    children: [
        Widget.Box({
            homogeneous: true,
            class_name: "row horizontal",
            children: toggles.map(w => w()),
        }),
        ...menus.map(w => w()),
    ],
})

const Calendar = () => Widget.Box({
    vertical: true,
    class_name: "calendarsettings vertical",
    css: calendarsettings.width.bind().as(w => `min-width: ${w}px;`),
    children: [
        Header(),
        Widget.Box({
            class_name: "calendar",
            children: [
                Widget.Calendar({
                    hexpand: true,
                    hpack: "center",
                }),
            ],
        }),
    ],
})

const CalendarSettings = () => PopupWindow({
    name: "calendarsettings",
    exclusivity: "exclusive",
    transition: bar.position.bind().as(pos => pos === "top" ? "slide_down" : "slide_up"),
    layout: layout.value,
    child: Calendar(),
})

export function setupCalendarSettings() {
    App.addWindow(CalendarSettings())
    layout.connect("changed", () => {
        App.removeWindow("calendarsettings")
        App.addWindow(Calendar())
    })
}
