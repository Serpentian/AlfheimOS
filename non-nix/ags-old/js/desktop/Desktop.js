import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import DesktopMenu from './DesktopMenu.js';

const Desktop = () => Widget.EventBox({
    on_secondary_click: (_, event) => DesktopMenu().popup_at_pointer(event),
});

/** @param {number} monitor */
export default monitor => Widget.Window({
    monitor,
    name: `desktop${monitor}`,
    layer: 'background',
    class_name: 'desktop',
    anchor: ['top', 'bottom', 'left', 'right'],
    child: Desktop(),
});

