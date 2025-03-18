#!/usr/bin/env bash
set -xeuo pipefail

gamescopeArgs=(
    --adaptive-sync # VRR support
    --hdr-enabled
    --mangoapp # performance overlay
    --rt
    --steam
)
steamArgs=(
    -pipewire-dmabuf
    -tenfoot
)
mangoConfig=(
    cpu_temp
    gpu_temp
    ram
    vram
)
mangoVars=(
    MANGOHUD=1
    MANGOHUD_CONFIG="$(IFS=,; echo "${mangoConfig[*]}")"
)

export "${mangoVars[@]}"
exec gamescope "${gamescopeArgs[@]}" -- steam "${steamArgs[@]}"
