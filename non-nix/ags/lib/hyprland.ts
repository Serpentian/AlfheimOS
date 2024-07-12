import options from "options"
const { messageAsync } = await Service.import("hyprland")

const {
    hyprland,
    theme: {
        spacing,
        radius,
        border: { width },
        blur,
        shadows,
        palette: {
            primary: { bg: active },
        },
    },
} = options

const deps = [
    "hyprland",
    spacing.id,
    radius.id,
    blur.id,
    width.id,
    shadows.id,
    active.id,
]

function rgba(color: string) {
    return `rgba(${color}ff)`.replace("#", "")
}

function sendBatch(batch: string[]) {
    const cmd = batch
        .filter(x => !!x)
        .map(x => `keyword ${x}`)
        .join("; ")

    return messageAsync(`[[BATCH]]/${cmd}`)
}

async function setupHyprland() {
//    const wm_gaps = Math.floor(hyprland.gaps.value * spacing.value)

//    sendBatch([
//        `general:border_size ${width}`,
//        `general:gaps_out ${wm_gaps}`,
//        `general:gaps_in ${Math.floor(wm_gaps / 2)}`,
//        `general:col.active_border ${rgba(active.value)}`,
//        `general:col.inactive_border ${rgba(hyprland.inactiveBorder.value)}`,
//        `decoration:rounding ${radius}`,
//        `decoration:drop_shadow ${shadows.value ? "yes" : "no"}`,
//        `dwindle:no_gaps_when_only ${hyprland.gapsWhenOnly.value ? 0 : 1}`,
//        `master:no_gaps_when_only ${hyprland.gapsWhenOnly.value ? 0 : 1}`,
//    ])

    await sendBatch(App.windows.map(({ name }) => `layerrule unset, ${name}`))

    if (blur.value > 0) {
        sendBatch(App.windows.flatMap(({ name }) => [
            `layerrule unset, ${name}`,
            `layerrule blur, ${name}`,
            `layerrule ignorealpha ${/* based on shadow color */.29}, ${name}`,
        ]))
    }
}

export default function init() {
    options.handler(deps, setupHyprland)
    setupHyprland()
}
