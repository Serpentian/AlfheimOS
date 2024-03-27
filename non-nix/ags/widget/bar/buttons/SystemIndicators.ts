import PanelButton from "../PanelButton"
import icons from "lib/icons"

const notifications = await Service.import("notifications")
// const bluetooth = await Service.import("bluetooth")
const audio = await Service.import("audio")
const network = await Service.import("network")
const hyprland = await Service.import('hyprland')
import { barAssignPosition, sh} from "lib/utils"

const MessageIndicator = () => {
    return Widget.Icon({
        visible: notifications.bind("notifications").as(n => n.length > 0),
        icon: icons.notifications.message,
    })
}

const MicrophoneIndicator = () => Widget.Icon()
    .hook(audio, self => self.visible =
        audio.recorders.length > 0
        || audio.microphone.stream?.is_muted
        || audio.microphone.is_muted)
    .hook(audio.microphone, self => {
        const vol = audio.microphone.stream!.is_muted ? 0 : audio.microphone.volume
        const { muted, low, medium, high } = icons.audio.mic
        const cons = [[67, high], [34, medium], [1, low], [0, muted]] as const
        self.icon = cons.find(([n]) => n <= vol * 100)?.[1] || ""
    })

const DNDIndicator = () => Widget.Icon({
    visible: notifications.bind("dnd"),
    icon: icons.notifications.silent,
})

const BluetoothIndicator = () => Widget.Overlay({
    class_name: "bluetooth",
    passThrough: true,
    child: Widget.Icon({
        icon: icons.bluetooth.enabled,
        visible: bluetooth.bind("enabled"),
    }),
    overlay: Widget.Label({
        hpack: "end",
        vpack: "start",
        label: bluetooth.bind("connected_devices").as(c => `${c.length}`),
        visible: bluetooth.bind("connected_devices").as(c => c.length > 0),
    }),
})

const AudioIndicator = () => Widget.Icon({
    icon: audio.speaker.bind("volume").as(vol => {
        const { muted, low, medium, high, overamplified } = icons.audio.volume
        const cons = [[101, overamplified], [67, high], [34, medium], [1, low], [0, muted]] as const
        const icon = cons.find(([n]) => n <= vol * 100)?.[1] || ""
        return audio.speaker.is_muted ? muted : icon
    }),
})

const LayoutIndicator = () => Widget.Label({label: 'en'})
    .hook(hyprland, (self, kb, layout) => {
        if (!layout) {
            return
        }

        if (layout.includes('English')) {
            self.label = `en`
        } else if (layout.includes('Russian')) {
            self.label = `ru`
        }
    }, "keyboard-layout")

export default (monitor: number, pos: string) => PanelButton({
    window: "quicksettings",
    on_primary_click: () => App.toggleWindow("quicksettings"),
    on_secondary_click: () => audio.microphone.is_muted = !audio.microphone.is_muted,
    on_scroll_up: () => audio.speaker.volume += 0.02,
    on_scroll_down: () => audio.speaker.volume -= 0.02,
    setup: self => { barAssignPosition(self, pos) },
    child: Widget.Box([
        LayoutIndicator(),
        MessageIndicator(),
        DNDIndicator(),
        AudioIndicator(),
        MicrophoneIndicator(),
    ]),
})
