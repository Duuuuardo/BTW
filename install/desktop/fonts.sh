#!/bin/bash

mkdir -p ~/.local/share/fonts

tmpdir=$(mktemp -d)

curl -fsSL -o "$tmpdir/CascadiaMono.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
unzip -o "$tmpdir/CascadiaMono.zip" -d "$tmpdir/CascadiaFont"
cp "$tmpdir/CascadiaFont"/*.ttf ~/.local/share/fonts

curl -fsSL -o "$tmpdir/iafonts.zip" https://github.com/iaolo/iA-Fonts/archive/refs/heads/master.zip
unzip -o "$tmpdir/iafonts.zip" -d "$tmpdir/iaFonts"
cp "$tmpdir/iaFonts"/iA-Fonts-master/iA\ Writer\ Mono/Static/iAWriterMonoS-*.ttf ~/.local/share/fonts

rm -rf "$tmpdir"
fc-cache
