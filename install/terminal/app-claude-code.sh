#!/bin/bash

# Install Claude Code CLI (requires Node.js)
# Ensure Node.js is available via mise
if ! command -v node &>/dev/null; then
  mise use --global node@lts
fi

npm install -g @anthropic-ai/claude-code
