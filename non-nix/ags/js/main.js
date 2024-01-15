import App from "resource:///com/github/Aylur/ags/app.js";
import { CornerTopleft, CornerTopright } from "./screencorner/ScreenCorners.js";
import { forMonitors, applyScss } from './utils.js';

applyScss();

const windows = () => [
    forMonitors(CornerTopleft),
    forMonitors(CornerTopright),
];

export default {
    style: `${App.configDir}/scss/style.css`,
    windows: windows(),
};
