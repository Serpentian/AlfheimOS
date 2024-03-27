import { clock } from "lib/variables"
import PanelButton from "../PanelButton"
import options from "options"
import { barAssignPosition } from "lib/utils"

const { format, action } = options.bar.date
const time = Utils.derive([clock, format], (c, f) => c.format(f) || "")

export default (monitor: number, pos: string) => PanelButton({
    window: "quicksettings",
    on_clicked: action.bind(),
    setup: self => { barAssignPosition(self, pos) },
    child: Widget.Label({
        justification: "center",
        label: time.bind(),
    }),
})
