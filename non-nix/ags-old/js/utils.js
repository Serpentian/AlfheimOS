import App from "resource:///com/github/Aylur/ags/app.js";
import {exec } from "resource:///com/github/Aylur/ags/utils.js";
import Gdk from 'gi://Gdk';

function range(length, start = 1) {
    return Array.from({ length }, (_, i) => i + start);
}

export function forMonitors(widget) {
    const n = Gdk.Display.get_default()?.get_n_monitors() || 1;
    return range(n, 0).map(widget).flat(1);
}

export function applyScss() {
  // Compile scss
  exec(`sassc ${App.configDir}/scss/main.scss ${App.configDir}/scss/style.css`);
  console.log("Scss compiled");

  // Apply compiled css
  App.resetCss();
  App.applyCss(`${App.configDir}/scss/style.css`);
  console.log("Compiled css applied");
};

