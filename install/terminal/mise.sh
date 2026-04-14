#!/bin/bash

# Install mise for managing multiple versions of languages. See https://mise.jdx.dev/
curl https://mise.run | sh

# Activate mise in the current session so subsequent scripts can use it
eval "$(~/.local/bin/mise activate bash)"
