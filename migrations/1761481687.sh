#!/bin/bash

# Force upgrade to gum 0.17.0 to fix issues with older versions
sudo apt update && sudo apt install -y --only-upgrade gum
