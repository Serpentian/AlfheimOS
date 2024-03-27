import cava from "service/cava"
import PanelButton from "../PanelButton"
import { barAssignPosition } from "lib/utils"
import options from "options"

const {
    dark,
    light,
    scheme,
} = options.theme

const t = (dark: Opt<any> | string, light: Opt<any> | string) =>
    scheme.value === "dark" ? `${dark}` : `${light}`

const primary = t(dark.primary.bg, light.primary.bg)
const secondary = t(dark.secondary.bg, light.secondary.bg)

// Pango’s text markup language
function formatIcons(input) {
  let output = '';
  for (let char of input) {
    let icon;
    switch (char) {
      case '▁':
        icon = `<span foreground='${secondary}'>▁</span>`;
        break;
      case '▂':
        icon = `<span foreground='${secondary}'>▂</span>`;
        break;
      case '▃':
        icon = `<span foreground='${secondary}'>▃</span>`;
        break;
      case '▄':
        icon = `<span foreground='${secondary}'>▄</span>`;
        break;
      case '▅':
        icon = `<span foreground='${primary}'>▅</span>`;
        break;
      case '▆':
        icon = `<span foreground='${primary}'>▆</span>`;
        break;
      case '▇':
        icon = `<span foreground='${primary}'>▇</span>`;
        break;
      case '█':
        icon = `<span foreground='${primary}'>█</span>`;
        break;
      default:
        icon = char;
        break;
    }
    output += icon;
  }
  return output;
}

export default (monitor: number, pos: string) => PanelButton({
    window: "cava",
    setup: self => { barAssignPosition(self, pos) },
    child: Widget.Label({use_markup: true})
        .hook(cava, self => {
            const data = formatIcons(cava.output)
            self.label = data
        }, "output-changed")
})
