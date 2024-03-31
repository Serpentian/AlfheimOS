import options from "options"
import { dependencies, sh } from "./utils"

export async function setWallpaper(wall: string) {
    await sh([
        "swww", "img",
        "--transition-type", "grow",
        "--transition-fps", "120",
        wall,
    ])
}

export default async function init() {
    if (!dependencies("swww"))
        return

    Utils.execAsync("swww init").catch(() => { })
    setWallpaper(options.wallpaper.value)
}
