import { type BarWidget } from "widget/bar/Bar"
import { opt, mkOptions } from "lib/option"
import { distro } from "lib/variables"
import { icon } from "lib/utils"
import icons from "lib/icons"

const options = mkOptions(OPTIONS, {
    autotheme: opt(false),

    wallpaper: opt(`/home/${USER}/.dotfiles/non-nix/wallpapers/evening-sky.png`, { persistent: true }),

    theme: {
        dark: {
            primary: {
                bg: opt("#89b4fa"),
                fg: opt("#11111b"),
            },
            secondary: {
                bg: opt("#cba6f7"),
                fg: opt("#11111b"),
            },
            error: {
                bg: opt("#e55f86"),
                fg: opt("#141414"),
            },
            bg: opt("#11111b"),
            fg: opt("#cdd6f4"),
            widget: opt("#25253a"),
            border: opt("#eeeeee"),
        },
        light: {
            primary: {
                bg: opt("#426ede"),
                fg: opt("#eeeeee"),
            },
            secondary: {
                bg: opt("#cba6f7"),
                fg: opt("#11111b"),
            },
            error: {
                bg: opt("#b13558"),
                fg: opt("#eeeeee"),
            },
            bg: opt("#fffffa"),
            fg: opt("#080808"),
            widget: opt("#25253a"),
            border: opt("#080808"),
        },

        blur: opt(36),
        scheme: opt<"dark" | "light">("dark"),
        widget: { opacity: opt(0) },
        border: {
            width: opt(1),
            opacity: opt(96),
        },

        shadows: opt(false),
        padding: opt(7),
        spacing: opt(12),
        radius: opt(15),
    },

    transition: opt(200),

    font: {
        size: opt(12),
        name: opt("JetBrains Mono"),
    },

    bar: {
        flatButtons: opt(false),
        position: opt<"top" | "bottom">("top"),
        corners: opt(true),
        layout: {
            start: opt<BarWidget[]>([
                "launcher",
                "media",
                // "taskbar",
                "expander",
                "cava"
            ]),
            center: opt<BarWidget[]>([
                "workspaces",
            ]),
            end: opt<BarWidget[]>([
                "cava",
                "expander",
                "systray",
                "system",
                // "battery",
                "date",
                // "powermenu",
            ]),
        },
        launcher: {
            icon: {
                colored: opt(true),
                icon: opt(icon(distro, icons.ui.search)),
            },
            label: {
                colored: opt(false),
                label: opt(""),
            },
            action: opt(() => App.toggleWindow("launcher")),
        },
        date: {
            format: opt("  %a, %d %b, %R"),
            action: opt(() => App.toggleWindow("quicksettings")),
        },
        battery: {
            bar: opt<"hidden" | "regular" | "whole">("regular"),
            charging: opt("#00D787"),
            percentage: opt(true),
            blocks: opt(7),
            width: opt(50),
            low: opt(30),
        },
        workspaces: {
            workspaces: opt(20),
            isJapanese: opt(true),
        },
        taskbar: {
            iconSize: opt(0),
            monochrome: opt(true),
            exclusive: opt(false),
        },
        messages: {
            action: opt(() => App.toggleWindow("quicksettings")),
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
            format: opt("󰎈 {artists} - {title} 󰎈"),
            length: opt(40),
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
                    "org.gnome.Nautilus",
                    "org.gnome.Calendar",
                    "obsidian",
                    "discord",
                    "spotify",
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
            image: opt(`/var/lib/AccountsService/icons/${Utils.USER}`),
            size: opt(70),
        },
        width: opt(380),
        position: opt<"left" | "center" | "right">("right"),
        networkSettings: opt("gtk-launch gnome-control-center"),
        media: {
            monochromeIcon: opt(true),
            coverSize: opt(100),
            blacklist: opt(["kdeconnect"]),
        },
    },

    datemenu: {
        position: opt<"left" | "center" | "right">("center"),
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
