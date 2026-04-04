#!/bin/bash

# Install mise for managing multiple versions of languages. See https://mise.jdx.dev/
yay -S --needed --noconfirm mise

# Activate mise in the current session so subsequent scripts can use it
eval "$(mise activate bash)"
