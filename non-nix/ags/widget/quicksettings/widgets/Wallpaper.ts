import { SimpleToggleButton } from "../ToggleButton"
import icons from "lib/icons"
import { setWallpaper } from "lib/swww"
import options from "options"

const { wallpaper, wallpaper_dir } = options
const { scheme } = options.theme

let current = wallpaper.value.substring(wallpaper.value.lastIndexOf('/') + 1)

export const CycleWallpaper = () => SimpleToggleButton({
    icon: icons.ui.wallpaper,
    label: "Wallpaper",
    connection: [wallpaper_dir, () => false],
    toggle: () => {
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
