#!/bin/bash

ascii_art='
  ____                  __        _       __    __
 / __ \____ ___  ____ _/ /____  _/ /_    / /_  / /__    __
/ / / / __ `__ \/ __ `/ //_/ / / / __ \ / __ \/ __/ | /| / /
/ /_/ / / / / / / /_/ / ,< / /_/ / /_/ // /_/ / /_ | |/ |/ /
\____/_/ /_/ /_/\__,_/_/|_|\__,_/_.___(_)_.___/\__/ |__/|__/

'

# Define the color gradient (shades of Gruvbox)
colors=(
	'\033[38;5;142m' # Gruvbox green
	'\033[38;5;214m' # Gruvbox yellow
	'\033[38;5;208m' # Gruvbox orange
	'\033[38;5;167m' # Gruvbox red
	'\033[38;5;175m' # Gruvbox magenta
	'\033[38;5;109m' # Gruvbox blue
	'\033[38;5;142m' # Gruvbox green
)

# Split the ASCII art into lines
IFS=$'\n' read -rd '' -a lines <<<"$ascii_art"

# Print each line with the corresponding color
for i in "${!lines[@]}"; do
	color_index=$((i % ${#colors[@]}))
	echo -e "${colors[color_index]}${lines[i]}"
done
