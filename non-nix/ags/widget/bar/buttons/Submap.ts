import submap from "service/submap"
import PanelButton from "../PanelButton"

export default (pos: string) => PanelButton({
    class_name: "submap",
    hexpand: false,
    child: Widget.Label({
        single_line_mode: true,
    }).hook(submap, self => {
        self.label = submap.submap
    }, "submap-changed"),
    setup: self => {
        if (pos != null)
            self.toggleClassName(pos)
    },
}).hook(submap, self => {
    self.visible = submap.submap != "";
}, "submap-changed")
