#!/bin/bash

# Install Claude Code CLI (requires Node.js via mise)
if ! mise which node &>/dev/null; then
  mise use --global node@lts
fi

mise exec -- npm install -g @anthropic-ai/claude-code
