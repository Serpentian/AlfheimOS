import App from "resource:///com/github/Aylur/ags/app.js";
import { forMonitors, applyScss } from './utils.js';

import { CornerTopleft, CornerTopright } from "./screencorner/ScreenCorners.js";
import Desktop from './desktop/Desktop.js'

applyScss();

const windows = () => [
    forMonitors(Desktop),
    forMonitors(CornerTopleft),
    forMonitors(CornerTopright),
];

export default {
    style: `${App.configDir}/scss/style.css`,
    windows: windows(),
};
