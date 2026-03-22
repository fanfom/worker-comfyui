#!/usr/bin/env bash
set -e

SRC="/runpod-volume/models/clip_vision/model.safetensors"

if [ -f "$SRC" ]; then
  echo "Found CLIP Vision at $SRC"
else
  echo "WARNING: CLIP Vision not found at $SRC"
fi

TARGETS=(
  "/comfyui/models/clip_vision"
  "/ComfyUI/models/clip_vision"
  "/workspace/runpod-slim/ComfyUI/models/clip_vision"
  "/workspace/ComfyUI/models/clip_vision"
)

for dst in "${TARGETS[@]}"; do
  mkdir -p "$dst"
  if [ -f "$SRC" ]; then
    cp -f "$SRC" "$dst/model.safetensors"
    echo "Copied CLIP Vision -> $dst/model.safetensors"
  fi
done

exec "$@"


