# macOS Dotfiles

🍎 My personal dotfiles for macOS, managed with [chezmoi](https://chezmoi.io/).

## Prerequisites

- macOS (tested on macOS 13+)
- [Homebrew](https://brew.sh/) package manager

## Quick Installation

```bash
# Install Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install chezmoi
brew install chezmoi

# Initialize and apply dotfiles
chezmoi init --apply https://github.com/toyfer/dotfiles.git

# Install Homebrew packages
brew bundle install
```

## What's Included

### 🛠 Development Tools
- **Neovim** - Modern Vim-based editor
- **GitHub CLI** - Command-line interface for GitHub
- **Chezmoi** - Dotfiles manager

### 🖥 Applications
- **Warp** - Modern terminal with AI features
- **Visual Studio Code** - Code editor with extensions
- **Firefox** - Web browser
- **Discord** - Communication platform

### ⚙️ Configuration Files
- `.zshrc` - Zsh shell configuration (macOS default)
- `.zprofile` - Zsh profile for login shells
- `.gitconfig` - Git configuration
- `.vimrc` - Vim configuration
- `Brewfile` - Homebrew package definitions
- Neovim configuration（Neovim単体用設定／VSCode用キーマップ分離）

## NeovimとVSCodeの設定方針

- Neovimの設定は**Neovim単体での動作**を前提としています。
- VSCode拡張（`vscode-neovim`）は**キーマップ連携のみ**を目的として導入しています。
- VSCode上でNeovimの設定を適用する場合、`if not vim.g.vscode then ... end` などでVSCode環境を判別し、
  VSCodeではキーマップのみが有効になるように設定を分離しています。
- これにより、Neovim本体とVSCode上での動作が混在せず、安定した運用が可能です。

## Usage

### Managing Dotfiles
```bash
# Edit a configuration file
chezmoi edit ~/.zshrc

# See what would change
chezmoi diff

# Apply changes
chezmoi apply

# Add new dotfiles
chezmoi add ~/.config/new-config

# Update from repository
chezmoi update
```

### Managing Homebrew Packages
```bash
# Update Brewfile with currently installed packages
brew bundle dump --force --describe
chezmoi add ~/Brewfile

# Install packages from Brewfile
brew bundle install

# Cleanup unused packages
brew bundle cleanup
```

## macOS-Specific Features

- Optimized for macOS Terminal.app and iTerm2
- Homebrew integration for package management
- Zsh configuration (macOS default shell since Catalina)
- Compatible with macOS filesystem and permissions

## Customization

### Local Overrides
Create these files for local customizations that won't be synced:
- `~/.zshrc.local` - Local Zsh configuration
- `~/.gitconfig.local` - Local Git configuration

### VS Code Extensions
The following VS Code extensions are automatically installed:
- `asvetliakov.vscode-neovim` - Neovim integration（キーマップ連携用途のみ）
- `github.copilot` - GitHub Copilot
- `github.copilot-chat` - GitHub Copilot Chat

## Notes

- ✅ Git configuration is pre-configured with placeholder values - update name/email as needed
- ✅ Neovimの設定は単体動作用で、VSCode上ではキーマップのみ反映されます
- ✅ Modern CLI tools (eza, bat, fd, ripgrep, fzf, zoxide) are included and configured
- ✅ Editor settings are unified to use neovim consistently
- 🔒 Sensitive files like SSH keys are not included for security
- 📱 This setup is specifically tailored for macOS development workflow

## Repository Structure

```
dotfiles/
├── dot_zshrc              # Zsh configuration with modern CLI tools
├── dot_gitconfig          # Git configuration (unified with nvim)
├── dot_vimrc              # Vim configuration
├── dot_zprofile           # Zsh profile for login shells
├── Brewfile               # Homebrew package definitions
├── dot_config/
│   └── nvim/              # Neovim設定（単体用＋VSCode用キーマップ分離）
└── README.md              # This file
```

