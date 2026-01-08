#!/usr/bin/env bash
set -euo pipefail

# Build script for the paper (LaTeX + BibTeX via latexmk)
# Usage:
#   ./build.sh          # build PDF
#   ./build.sh clean    # remove build artifacts
#   ./build.sh watch    # auto-rebuild on file changes (if latexmk supports it)

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

MAIN_TEX="unfaithful_cut_undetectable_interventions.tex"
OUT_DIR="build"

mkdir -p "$OUT_DIR"

cmd_build() {
  echo "[build] Compiling $MAIN_TEX -> $OUT_DIR/"
  latexmk -pdf \
    -interaction=nonstopmode \
    -halt-on-error \
    -file-line-error \
    -outdir="$OUT_DIR" \
    "$MAIN_TEX"
  echo "[build] Done: $OUT_DIR/unfaithful_cut_undetectable_interventions.pdf"
}

cmd_clean() {
  echo "[clean] Removing latexmk artifacts in $OUT_DIR/"
  latexmk -C -outdir="$OUT_DIR" "$MAIN_TEX" || true
  # Also remove outdir if empty (optional)
  rmdir "$OUT_DIR" 2>/dev/null || true
  echo "[clean] Done"
}

cmd_watch() {
  echo "[watch] Auto-rebuild enabled. Press Ctrl+C to stop."
  latexmk -pdf \
    -pvc \
    -interaction=nonstopmode \
    -halt-on-error \
    -file-line-error \
    -outdir="$OUT_DIR" \
    "$MAIN_TEX"
}

case "${1:-}" in
  "" )
    cmd_build
    ;;
  clean )
    cmd_clean
    ;;
  watch )
    cmd_watch
    ;;
  * )
    echo "Unknown command: $1"
    echo "Usage: ./build.sh [clean|watch]"
    exit 2
    ;;
esac
