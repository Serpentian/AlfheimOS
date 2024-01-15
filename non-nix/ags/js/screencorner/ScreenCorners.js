import Widget from "resource:///com/github/Aylur/ags/widget.js";
import Gtk from "gi://Gtk";

/**
 * @param {string} place
 */
export const RoundedCorner = (place, props) => Widget.DrawingArea({
  ...props,
  hpack: place.includes("left") ? "start" : "end",
  vpack: place.includes("top") ? "start" : "end",
  setup: widget => {
    const r = 25; //widget.get_style_context().get_property('border-radius', Gtk.StateFlags.NORMAL);
    widget.set_size_request(r, r);
    widget.on("draw", (widget, cr) => {
      const c = widget.get_style_context().get_property("background-color", Gtk.StateFlags.NORMAL);
      const r = widget.get_style_context().get_property("border-radius", Gtk.StateFlags.NORMAL);
      widget.set_size_request(r, r);

      switch (place) {
        case "topleft":
          cr.arc(r, r, r, Math.PI, 3 * Math.PI / 2);
          cr.lineTo(0, 0);
          break;
        case "topright":
          cr.arc(0, r, r, 3 * Math.PI / 2, 2 * Math.PI);
          cr.lineTo(r, 0);
          break;
        case "bottomleft":
          cr.arc(r, 0, r, Math.PI / 2, Math.PI);
          cr.lineTo(0, r);
          break;
        case "bottomright":
          cr.arc(0, 0, r, 0, Math.PI / 2);
          cr.lineTo(r, r);
          break;
      }

      cr.closePath();
      cr.setSourceRGBA(c.red, c.green, c.blue, c.alpha);
      cr.fill();
    });
  }
});

export const CornerTopleft = (monitor) => Widget.Window({
  name: `corner-${monitor}-topleft`,
  monitor,
  layer: "overlay",
  anchor: ["top", "left"],
  exclusivity: "normal",
  visible: true,
  child: RoundedCorner("topleft", {className: "corner",}),
});

export const CornerTopright = (monitor) => Widget.Window({
  name: `corner-${monitor}-topright`,
  monitor,
  layer: "overlay",
  anchor: ["top", "right"],
  exclusivity: "normal",
  visible: true,
  child: RoundedCorner("topright", {className: "corner",}),
});

export default RoundedCorner;

