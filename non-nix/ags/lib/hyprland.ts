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
