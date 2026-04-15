#!/bin/bash

sudo apt install -y \
  build-essential pkg-config clang patch pipx \
  libssl-dev libreadline-dev libyaml-dev libncurses-dev libgdbm-dev libjemalloc-dev \
  libvips-dev imagemagick graphicsmagick mupdf mupdf-tools \
  sqlite3 libsqlite3-dev mariadb-client libpqxx-dev libpq-dev \
  jq

# pgcli via pipx (keeps it isolated from system Python)
pipx install pgcli
