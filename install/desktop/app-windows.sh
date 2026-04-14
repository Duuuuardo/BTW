#!/bin/bash

if [[ "$BTW_INSTALL_WINDOWS_VM" == "yes" ]]; then
  source $BTW_PATH/bin/btw-windows-vm install
fi
