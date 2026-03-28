#!/usr/bin/env bash
set -euo pipefail

INSTALL_DIR="${HOME}/.claude/skills/creo-image-prompt"

if [ -d "$INSTALL_DIR" ]; then
  rm -rf "$INSTALL_DIR"
  echo "claude-image-prompt uninstalled from $INSTALL_DIR"
else
  echo "claude-image-prompt is not installed at $INSTALL_DIR"
fi
