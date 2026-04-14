# UBTW

**UBTW** (_by the way, I use Ubuntu_) is an opinionated Ubuntu setup for web development. Run a single command on a fresh Ubuntu install and get a fully configured, beautiful development environment ready to go.

Based on [BTW](https://github.com/Duuuuardo/btw) and built on top of [Omakub](https://omakub.org) by DHH, UBTW adapts the same philosophy — a curated, complete dev setup — but for Ubuntu GNOME.

## What's included

- **Shell**: zsh with Starship prompt
- **Terminal**: Alacritty + Zellij (multiplexer)
- **Editor**: Neovim (LazyVim) configured for PHP, C#, TypeScript, Rust, and frontend development — with Claude Code and Copilot integration
- **Theme**: Gruvbox Material across the entire stack (terminal, editor, Neovim, btop, GNOME)
- **Desktop**: GNOME with Gruvbox Material wallpaper, ULauncher, and curated dock
- **Dev tools**: Docker, Git, GitHub CLI, mise (language version manager), and more
- **Package manager**: apt

## Quick start

```bash
wget -qO- https://raw.githubusercontent.com/Duuuuardo/btw/ubtw/boot.sh | bash
```

## Post-install

Use the `btw` command to manage your setup — install additional apps, change fonts, update, or uninstall components.

## Credits

Based on [BTW](https://github.com/Duuuuardo/btw) by Eduardo Fabisiak, [Omakub](https://github.com/basecamp/omakub) by DHH and Basecamp. Neovim config inspired by [craftzdog's dotfiles](https://github.com/craftzdog/dotfiles-public).

## License

UBTW is released under the [MIT License](https://opensource.org/licenses/MIT).
