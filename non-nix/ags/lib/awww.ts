import options from "options"
import { dependencies, sh } from "./utils"

export async function setWallpaper(wall: string) {
    await sh([
        "awww", "img",
        "--transition-type", "grow",
        "--transition-fps", "120",
        wall,
    ])
}

export default async function init() {
    if (!dependencies("awww"))
        return

    Utils.execAsync("awww init").catch(() => { })
    setWallpaper(options.wallpaper.value)
}
