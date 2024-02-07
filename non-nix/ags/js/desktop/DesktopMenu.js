import * as Utils from 'resource:///com/github/Aylur/ags/utils.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import App from 'resource:///com/github/Aylur/ags/app.js';
import icons from '../icons.js';
import Gtk from 'gi://Gtk';

/**
 * @param {string} label
 * @param {string} icon
 * @param {import('types/widgets/menu').MenuItemProps['on_activate']} on_activate
 */
const Item = (label, icon, on_activate) => Widget.MenuItem({
    on_activate,
    child: Widget.Box({
        children: [
            Widget.Icon(icon),
            Widget.Label({
                label,
                hexpand: true,
                xalign: 0,
            }),
        ],
    }),
});

export default () => Widget.Menu({
    class_name: 'desktop-menu',
    children: [
        Widget.MenuItem({
            child: Widget.Box({
                children: [
                    Widget.Icon(icons.powermenu.shutdown),
                    Widget.Label({
                        label: 'System',
                        hexpand: true,
                        xalign: 0,
                    }),
                ],
            }),
            submenu: Widget.Menu({
                children: [
                    Item('Shutdown', icons.powermenu.shutdown, () => Utils.execAsync('systemctl poweroff')),
                    Item('Reboot', icons.powermenu.reboot, () => Utils.execAsync('systemctl reboot')),
                    Item('Log Out', icons.powermenu.logout, () => Utils.execAsync('hyprctl dispatch exit')),
                ],
            }),
        }),
        Widget.MenuItem({
            child: Widget.Box({
                children: [
                    Widget.Icon(icons.apps.apps),
                    Widget.Label({
                        label: 'Applications',
                        hexpand: true,
                        xalign: 0,
                    }),
                ],
            }),
            submenu: Widget.Menu({
                children: [
                    Item('Kitty', icons.apps.terminal, () => Utils.execAsync('kitty')),
                    Item('Firefox', icons.apps.firefox,() => Utils.execAsync('firefox')),
                ],
            }),
        }),
    ],
});

