#!/bin/bash

yay -S --needed --noconfirm base-devel pkgconf clang rust patch python-pipx \
  openssl readline libyaml ncurses gdbm jemalloc libvips imagemagick graphicsmagick mupdf mupdf-tools \
  redis sqlite mariadb-clients libpqxx postgresql-libs pgcli jq
