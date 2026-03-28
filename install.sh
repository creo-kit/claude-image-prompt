#!/usr/bin/env bash
set -euo pipefail

REPO="creo-kit/claude-image-prompt"
INSTALL_DIR="${HOME}/.claude/skills/creo-image-prompt"

cleanup() {
  if [ -d "${TMPDIR:-/tmp}/_creo_image_prompt_install" ]; then
    rm -rf "${TMPDIR:-/tmp}/_creo_image_prompt_install"
  fi
}
trap cleanup EXIT

echo "Installing claude-image-prompt..."

if [ -d "$INSTALL_DIR" ]; then
  echo "Updating existing installation at $INSTALL_DIR"
  rm -rf "$INSTALL_DIR"
fi

mkdir -p "$(dirname "$INSTALL_DIR")"

CLONE_DIR="${TMPDIR:-/tmp}/_creo_image_prompt_install"
rm -rf "$CLONE_DIR"

git clone --depth 1 "https://github.com/${REPO}.git" "$CLONE_DIR" 2>/dev/null

mkdir -p "$INSTALL_DIR/skills/creo-image-prompt"
cp "$CLONE_DIR/skills/creo-image-prompt/SKILL.md" "$INSTALL_DIR/skills/creo-image-prompt/SKILL.md"
cp "$CLONE_DIR/.claude-plugin/plugin.json" "$INSTALL_DIR/.claude-plugin/plugin.json" 2>/dev/null || true
cp "$CLONE_DIR/LICENSE" "$INSTALL_DIR/LICENSE"

echo ""
echo "claude-image-prompt installed to $INSTALL_DIR"
echo ""
echo "Usage:  /creo image-prompt <context>"
echo ""
