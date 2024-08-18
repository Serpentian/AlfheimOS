import icons from "lib/icons"
import { uptime } from "lib/variables"
import options from "options"
import powermenu, { Action } from "service/powermenu"

const battery = await Service.import("battery")
const { image, size } = options.quicksettings.avatar
const message = options.quicksettings.avatar.message

function up(up: number) {
    const h = Math.floor(up / 60)
    const m = Math.floor(up % 60)
    return `${h}h ${m < 10 ? "0" + m : m}m`
}

const Avatar = () => Widget.Box({
    class_name: "avatar",
    css: Utils.merge([image.bind(), size.bind()], (img, size) => `
        min-width: ${size}px;
        min-height: ${size}px;
        background-image: url('${img}');
        background-size: cover;
    `),
})

const SysButton = (action: Action) => Widget.Button({
    vpack: "center",
    child: Widget.Icon(icons.powermenu[action]),
    on_clicked: () => powermenu.action(action),
})

export const Header = () => Widget.Box(
    { class_name: "header horizontal" },
    Avatar(),
    Widget.Box({
        vertical: true,
        vpack: "center",
        children: [
            Widget.Label({
                label: message.value,
            }),
        ],
    }),
    Widget.Box({ hexpand: true }),
    SysButton("reboot"),
    SysButton("logout"),
    SysButton("shutdown"),
)
