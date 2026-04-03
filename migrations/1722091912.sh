#!/bin/bash

sudo echo "Running upgrade migration..."

# Add rustc and pgsql client libs
source $BTW_PATH/install/terminal/libraries.sh

# Set name and class for desktop files
source $BTW_PATH/applications/About.sh
source $BTW_PATH/applications/Activity.sh
source $BTW_PATH/applications/Docker.sh
source $BTW_PATH/applications/Neovim.sh
source $BTW_PATH/applications/Btw.sh
source $BTW_PATH/applications/WhatsApp.sh
