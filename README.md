# Dotfiles

My personal dotfiles managed with [chezmoi](https://chezmoi.io/).

## Installation

To install these dotfiles on a new machine:

```bash
# Install chezmoi
brew install chezmoi

# Initialize with this repository (replace with your actual repo URL)
chezmoi init https://github.com/yourusername/dotfiles.git

# Apply the dotfiles
chezmoi apply
```

## Usage

### Adding new dotfiles
```bash
# Add a new dotfile to chezmoi
chezmoi add ~/.filename

# Edit a dotfile
chezmoi edit ~/.filename

# Apply changes
chezmoi apply
```

### Updating dotfiles
```bash
# See what would change
chezmoi diff

# Apply changes
chezmoi apply

# Update from repository
chezmoi update
```

## Files managed

- `.zshrc` - Zsh shell configuration
- `.zprofile` - Zsh profile
- `.vimrc` - Vim configuration
- `.gitconfig` - Git configuration

## Notes

- Remember to update the git user name and email in `.gitconfig`
- The `.zshrc` includes basic aliases and history settings
- Local customizations can be added to `.zshrc.local`

