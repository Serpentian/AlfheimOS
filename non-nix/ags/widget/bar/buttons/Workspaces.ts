import PanelButton from "../PanelButton"
import options from "options"
import { sh, range } from "lib/utils"
import { barAssignPosition } from "lib/utils"

const hyprland = await Service.import("hyprland")
const { workspaces, isJapanese } = options.bar.workspaces

const dispatch = (arg: string | number) => {
    sh(`hyprctl dispatch workspace ${arg}`)
}

const arrLabelsInJapanese = [
  '一',
  '二',
  '三',
  '四',
  '五',
  '六',
  '七',
  '八',
  '九',
  '十',
  '十一',
  '十二',
  '十三',
  '十四',
  '十五',
  '十六',
  '十七',
  '十八',
  '十九',
  '二十',
]

const Workspaces = (ws: number, monitor: number) => Widget.Box({
    children: range(ws || 20).map(i => Widget.Label({
        attribute: i,
        vpack: "center",
        label: isJapanese.bind().as(j => j ? `${arrLabelsInJapanese[i - 1]}`: `${i}`),
        no_show_all: true,
        setup: self => self.hook(hyprland, () => {
            self.toggleClassName("active", hyprland.active.workspace.id === i)
            self.toggleClassName("occupied", (hyprland.getWorkspace(i)?.windows || 0) > 0)
            self.visible = Boolean(hyprland.getWorkspace(i)) && hyprland.getWorkspace(i).monitorID === monitor
        }),
    })),
    setup: box => {
        if (ws === 0) {
            box.hook(hyprland.active.workspace, () => box.children.map(btn => {
                btn.visible = hyprland.workspaces.some(ws => ws.id === btn.attribute)
            }))
        }
    },
})

export default (monitor: number, pos: string) => {
    return PanelButton({
        window: "overview",
        class_name: "workspaces",
        on_scroll_up: () => dispatch("r-1"),
        on_scroll_down: () => dispatch("r+1"),
        on_clicked: () => App.toggleWindow("overview"),
        setup: self => { barAssignPosition(self, pos) },
        // child: workspaces.bind().as(Workspaces),
        child: Workspaces(workspaces, monitor),
    })
}
