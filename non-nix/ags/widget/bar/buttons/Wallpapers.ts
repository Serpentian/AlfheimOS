import PanelButton from "../PanelButton"
import { barAssignPosition } from "lib/utils"
import options from "options"
import icons from "lib/icons"
import { setWallpaper } from "lib/swww"
import { dependencies, sh} from "lib/utils"

const { wallpaper, wallpaper_dir } = options
const { scheme } = options.theme

let current = wallpaper.value.substring(wallpaper.value.lastIndexOf('/') + 1)

export default (monitor: number, pos: string) => {
    if (!dependencies("swww"))
        return

    return PanelButton({
        setup: self => { barAssignPosition(self, pos) },
        child: Widget.Icon(icons.ui.wallpaper),
        on_clicked: () => {
            const path = wallpaper_dir.value.concat('/', scheme)
            Utils.subprocess(
                ['bash', `${App.configDir}/scripts/next_file.sh`, current, path],
                (output) => {
                    current = output
                    const new_wall = path.concat('/', output)
                    setWallpaper(new_wall)
                },
                (err) => logError(err),
            )
        },
    })
}
