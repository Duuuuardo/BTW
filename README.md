# BTW

**BTW** (_by the way, I use Arch_) is an opinionated Arch Linux setup for web development. Run a single command on a fresh Arch install and get a fully configured, beautiful development environment ready to go.

Built on top of [Omakub](https://omakub.org) by DHH, BTW adapts the same philosophy — a curated, complete dev setup — but tailored for Arch Linux.

## What's included

- **Shell**: zsh with Starship prompt
- **Terminal**: Alacritty + Zellij (multiplexer)
- **Editor**: Neovim (LazyVim) configured for PHP, C#, TypeScript, Rust, and frontend development — with Claude Code and Copilot integration
- **Theme**: Gruvbox Material across the entire stack (terminal, editor, Neovim, btop, GNOME)
- **Desktop**: GNOME with Gruvbox Material wallpaper, ULauncher, and curated dock
- **Dev tools**: Docker, Git, GitHub CLI, mise (language version manager), and more
- **Package manager**: pacman + yay (AUR)

## Quick start

```bash
wget -qO- https://raw.githubusercontent.com/Duuuuardo/btw/master/boot.sh | bash
```

## Post-install

Use the `btw` command to manage your setup — install additional apps, change fonts, update, or uninstall components.

## Credits

Based on [Omakub](https://github.com/basecamp/omakub) by DHH and Basecamp. Neovim config inspired by [craftzdog's dotfiles](https://github.com/craftzdog/dotfiles-public).

## License

BTW is released under the [MIT License](https://opensource.org/licenses/MIT).
