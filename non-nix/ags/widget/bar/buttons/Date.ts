import { clock } from "lib/variables"
import PanelButton from "../PanelButton"
import options from "options"

const { format, action } = options.bar.date
const time = Utils.derive([clock, format], (c, f) => c.format(f) || "")

export default (pos: string) => PanelButton({
    window: "datemenu",
    on_clicked: action.bind(),
    setup: self => {
        if (pos != null)
            self.toggleClassName(pos)
    },
    child: Widget.Label({
        justification: "center",
        label: time.bind(),
    }),
})
