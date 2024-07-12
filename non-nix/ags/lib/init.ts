import hyprland from "./hyprland"
import lowBattery from "./battery"
import notifications from "./notifications"
import swww from "./swww"

export default function init() {
    try {
        lowBattery()
        notifications()
        swww()
        hyprland()
    } catch (error) {
        logError(error)
    }
}
