import { opt, mkOptions } from "lib/option"
import { icon } from "lib/utils"
import icons from "lib/icons"

const nix = JSON.parse(
    Utils.readFile(Utils.CACHE_DIR + "/options-nix.json") || '{}')

const options = mkOptions(OPTIONS, {
    wallpaper: opt(nix?.wallpaper || ""),

    theme: {
        palette: {
            primary: {
                bg: opt(nix?.theme?.palette?.primary?.bg || "#51a4e7"),
                fg: opt(nix?.theme?.palette?.primary?.fg || "#141414"),
            },
            secondary: {
                bg: opt(nix?.theme?.palette?.secondary?.bg || "#51a4e7"),
                fg: opt(nix?.theme?.palette?.secondary?.fg || "#141414"),
            },
            error: {
                bg: opt(nix?.theme?.palette?.error?.bg || "#e55f86"),
                fg: opt(nix?.theme?.palette?.error?.fg || "#141414"),
            },
            bg: opt(nix?.theme?.palette?.bg || "#171717"),
            fg: opt(nix?.theme?.palette?.fg || "#eeeeee"),
            widget: opt(nix?.theme?.palette?.widget || "#eeeeee"),
            border: opt(nix?.theme?.palette?.border || "#eeeeee"),
        },

        blur: opt(nix?.theme?.blur || 0),
        widget: { opacity: opt(nix?.widget?.opacity || 0) },
        border: {
            width: opt(nix?.theme?.border?.width || 0),
            opacity: opt(nix?.theme?.border?.opacity || 0),
        },

        shadows: opt(nix?.theme?.shadows || false),
        padding: opt(7),
        spacing: opt(12),
        radius: opt(nix?.theme?.radius || 0),
    },

    transition: opt(200),

    font: {
        size: opt(nix?.font?.size || 12),
        name: opt(nix?.font?.name || "Ubuntu Nerd Font"),
    },

    bar: {
        curved: opt(nix?.bar?.curved || false),
        flatButtons: opt(nix?.bar?.flatButtons || false),
        position: opt<"top" | "bottom">("top"),
        corners: opt(50),
        transparent: opt(false),
        layout: {
            start: opt<Array<import("widget/bar/Bar").BarWidget>>([
                "launcher",
                "workspaces",
                // "taskbar",
                "media",
                "expander",
                "cava",
            ]),
            center: opt<Array<import("widget/bar/Bar").BarWidget>>([
                "date",
            ]),
            end: opt<Array<import("widget/bar/Bar").BarWidget>>([
                "cava",
                "expander",
                "submap",
                "battery",
                "systray",
                "system",
                "powermenu",
            ]),
        },
        launcher: {
            icon: {
                colored: opt(false),
                icon: opt(icon(icons.nix.nix, icons.ui.search)),
            },
            label: {
                colored: opt(false),
                label: opt(""),
            },
            action: opt(() => App.toggleWindow("launcher")),
        },
        date: {
            format: opt("%R, %a, %d %b"),
            action: opt(() => App.toggleWindow("datemenu")),
        },
        battery: {
            bar: opt<"hidden" | "regular" | "whole">("hidden"),
            charging: opt("#00D787"),
            percentage: opt(true),
            blocks: opt(7),
            width: opt(50),
            low: opt(30),
        },
        workspaces: {
            workspaces: opt(7),
        },
        taskbar: {
            iconSize: opt(0),
            monochrome: opt(true),
            exclusive: opt(false),
        },
        systray: {
            ignore: opt([
                "KDE Connect Indicator",
                "spotify-client",
            ]),
        },
        media: {
            monochrome: opt(true),
            preferred: opt("spotify"),
            direction: opt<"left" | "right">("right"),
            format: opt("󰎈 {artist} - {title} 󰎈"),
            length: opt(0),
        },
        powermenu: {
            monochrome: opt(false),
            action: opt(() => App.toggleWindow("powermenu")),
        },
    },

    launcher: {
        width: opt(0),
        margin: opt(80),
        nix: {
            pkgs: opt("nixpkgs/nixos-unstable"),
            max: opt(8),
        },
        sh: {
            max: opt(16),
        },
        apps: {
            iconSize: opt(62),
            max: opt(6),
            favorites: opt([
                [
                    "firefox",
                    "Browse the filesystem", // Thunar
                ],
            ]),
        },
    },

    overview: {
        scale: opt(9),
        workspaces: opt(7),
        monochromeIcon: opt(true),
    },

    powermenu: {
        sleep: opt("systemctl suspend"),
        reboot: opt("systemctl reboot"),
        logout: opt("pkill Hyprland"),
        shutdown: opt("shutdown now"),
        layout: opt<"line" | "box">("line"),
        labels: opt(true),
    },

    quicksettings: {
        avatar: {
            image: opt(`${Utils.HOME}/.dotfiles/non-nix/avatars/makise.png`),
            message: opt('See you,\nspace cowboy...'),
            size: opt(70),
        },
        width: opt(380),
        position: opt<"left" | "center" | "right">("right"),
        networkSettings: opt("gtk-launch gnome-control-center"),
        media: {
            monochromeIcon: opt(true),
            coverSize: opt(100),
        },
    },

    datemenu: {
        position: opt<"left" | "center" | "right">("center"),
        weather: {
            interval: opt(60_000),
            unit: opt<"metric" | "imperial" | "standard">("metric"),
            key: opt<string>(
                JSON.parse(Utils.readFile(`${App.configDir}/.weather`) || "{}")?.key || "",
            ),
            cities: opt<Array<number>>(
                JSON.parse(Utils.readFile(`${App.configDir}/.weather`) || "{}")?.cities || [],
            ),
        },
    },

    osd: {
        progress: {
            vertical: opt(true),
            pack: {
                h: opt<"start" | "center" | "end">("end"),
                v: opt<"start" | "center" | "end">("center"),
            },
        },
        microphone: {
            pack: {
                h: opt<"start" | "center" | "end">("center"),
                v: opt<"start" | "center" | "end">("end"),
            },
        },
    },

    notifications: {
        position: opt<Array<"top" | "bottom" | "left" | "right">>(["top", "right"]),
        blacklist: opt(["Spotify"]),
        width: opt(440),
    },

    hyprland: {
        gaps: opt(1.6),
        inactiveBorder: opt("33333300"),
        gapsWhenOnly: opt(true),
    },
})

globalThis["options"] = options
export default options
