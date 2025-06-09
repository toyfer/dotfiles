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
- **Neovim** - Modern Vim-based editor with LSP support
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
- Neovim configuration (LazyVim setup)

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
- `asvetliakov.vscode-neovim` - Neovim integration
- `github.copilot` - GitHub Copilot
- `github.copilot-chat` - GitHub Copilot Chat

## Notes

- 🔧 Remember to update your Git user name and email in `.gitconfig`
- 🎨 The Neovim configuration uses LazyVim for a modern IDE experience
- 🔒 Sensitive files like SSH keys are not included for security
- 📱 This setup is specifically tailored for macOS development workflow

