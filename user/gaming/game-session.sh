#!/usr/bin/env bash
set -xeuo pipefail

gamescopeArgs=(
    # --adaptive-sync # VRR support
    --hdr-enabled
    # --mangoapp # performance overlay
    --rt
    --steam
    --hdr-debug-force-output
)

steamArgs=(
    -pipewire-dmabuf
    -tenfoot
)

export DXVK_HDR=1
exec gamescope "${gamescopeArgs[@]}" -- steam "${steamArgs[@]}"
