import hyprland from "./hyprland"
import lowBattery from "./battery"
import notifications from "./notifications"
import awww from "./awww"

export default function init() {
    try {
        lowBattery()
        notifications()
        awww()
        hyprland()
    } catch (error) {
        logError(error)
    }
}
