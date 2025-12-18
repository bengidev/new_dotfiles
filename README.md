# My Dotfiles

Personal configuration files for various tools and applications.

## 📁 Structure

```
new_dotfiles/
├── nvim/          # Neovim configuration (LazyVim-based)
├── (future)       # More configs to come...
```

## 🗂️ Available Configurations

### [Neovim](./nvim/)

A modern Neovim configuration built on **LazyVim** with 50+ plugins.

**Quick Install:**
```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Copy new config
cp -r nvim ~/.config/nvim

# Open Neovim - plugins will auto-install
nvim
```

See the [Neovim README](./nvim/README.md) for full documentation and keymaps.

## 📦 Requirements

- **Git** >= 2.19.0
- Tool-specific requirements listed in each subfolder

## 🔗 Links

- [Neovim Documentation](./nvim/README.md)

## 📄 License

MIT License
