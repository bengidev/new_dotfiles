# Neovim Configuration

A modern Neovim configuration built on **LazyVim** with features from [jdhao/nvim-config](https://github.com/jdhao/nvim-config).

## ✨ Features

- **LazyVim** as the base configuration
- **50+ plugins** for a full-featured IDE experience
- **Ultra-fast fuzzy finding** with fzf-lua
- **Git integration** with fugitive, gitsigns, and diffview
- **Modern code folding** with nvim-ufo
- **LSP support** with auto-completion
- **Beautiful UI** with lualine, bufferline, and multiple colorschemes

## 📦 Requirements

- **Neovim** >= 0.9.0 (0.10+ recommended)
- **Git** >= 2.19.0
- **fzf** (for fuzzy finding): `brew install fzf`
- **ripgrep** (for live grep): `brew install ripgrep`
- **fd** (for file finding): `brew install fd`
- **A Nerd Font** (for icons): [Download here](https://www.nerdfonts.com/)

### Optional Dependencies

- **ctags** (for Vista tags): `brew install universal-ctags`
- **lazygit** (for git UI): `brew install lazygit`
- **node** (for some LSP servers): `brew install node`

## 🚀 Installation

### Using GNU Stow (Recommended)

```bash
# Clone the dotfiles repository
git clone https://github.com/bengidev/dotfiles.git ~/dotfiles

# Navigate to dotfiles directory
cd ~/dotfiles

# Stow the nvim configuration
stow nvim
```

### Manual Installation

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone and copy
git clone https://github.com/bengidev/dotfiles.git ~/dotfiles
cp -r ~/dotfiles/nvim/.config/nvim ~/.config/nvim
```

### First Run

```bash
# Open Neovim - plugins will auto-install
nvim

# Run health check to verify installation
:checkhealth
```

## ⌨️ Keymaps

> **Note:** `<leader>` is set to **Space** by default in LazyVim.

### 📁 File Operations

| Keymap | Description |
|--------|-------------|
| `<leader>w` | Save file |
| `<leader>q` | Quit window |
| `<leader>Q` | Quit all windows |
| `<leader>y` | Copy entire buffer to clipboard |
| `<leader>ev` | Edit nvim config |
| `<leader>sv` | Reload nvim config |

### 🔍 Fuzzy Finding (fzf-lua)

| Keymap | Description |
|--------|-------------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search in files) |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Search help tags |
| `<leader>fr` | Recent files |
| `<leader>fc` | Command history |
| `<leader>ft` | Buffer tags |
| `<leader>fG` | Git files |
| `<leader>fy` | Yank history |

### 🌿 Git Operations

| Keymap | Description |
|--------|-------------|
| `<leader>gs` | Git status |
| `<leader>gw` | Git add (stage) current file |
| `<leader>gc` | Git commit |
| `<leader>gpl` | Git pull |
| `<leader>gpu` | Git push |
| `<leader>gd` | Git diff split |
| `<leader>gB` | Git blame |
| `<leader>gl` | Git log |
| `<leader>gbn` | Create new branch |
| `<leader>gbd` | Delete branch |
| `<leader>gD` | Open Diffview |
| `<leader>gh` | File git history |
| `<leader>gH` | Full git history |
| `<leader>gY` | Copy git permalink |
| `<leader>gO` | Open git permalink in browser |

### 🧭 Navigation

| Keymap | Description |
|--------|-------------|
| `<Space>t` | Toggle Vista (tags sidebar) |
| `<leader>hw` | Hop to word |
| `<leader>hl` | Hop to line |
| `<leader>hc` | Hop to 2-character |
| `<leader>hp` | Hop to pattern |
| `gb` | Go to buffer [count] or next |
| `n` / `N` | Next/prev search with index [x/y] |

### 📝 Editing

| Keymap | Mode | Description |
|--------|------|-------------|
| `jj` / `jk` / `kk` | Insert | Escape to normal mode |
| `<A-j>` | Normal/Visual | Move line(s) down |
| `<A-k>` | Normal/Visual | Move line(s) up |
| `<C-u>` | Insert | Word to UPPERCASE |
| `<C-t>` | Insert | Word to Title Case |
| `<leader>v` | Normal | Reselect last pasted text |
| `<leader><Space>` | Normal | Strip trailing whitespace |

### ✂️ Surround Operations (vim-sandwich)

| Keymap | Description |
|--------|-------------|
| `sa{motion}{char}` | Add surrounding (e.g., `saiw"` surrounds word with `"`) |
| `sd{char}` | Delete surrounding (e.g., `sd"` deletes `"`) |
| `sr{old}{new}` | Replace surrounding (e.g., `sr"'` replaces `"` with `'`) |

### 📋 Yank History (yanky)

| Keymap | Description |
|--------|-------------|
| `<C-p>` | Cycle to previous yank (after paste) |
| `<C-n>` | Cycle to next yank (after paste) |
| `<leader>fy` | Open yank history |

### 📂 Code Folding (nvim-ufo)

| Keymap | Description |
|--------|-------------|
| `zR` | Open all folds |
| `zM` | Close all folds |
| `zr` | Open folds (by level) |
| `zm` | Close folds (by level) |
| `K` | Peek folded lines (or LSP hover) |

### 🔧 Utilities

| Keymap | Description |
|--------|-------------|
| `<F9>` | Run current file (Python, Lua, JS, etc.) |
| `<F11>` | Toggle spell check |
| `<F12>` | Toggle paste mode |
| `\d` | Close current buffer |
| `\x` | Close quickfix/location window |
| `<leader>cd` | CD to current file's directory |
| `<leader>cl` | Toggle cursor column |

### 📖 Text Objects

| Keymap | Description |
|--------|-------------|
| `iB` / `aB` | Entire buffer (e.g., `yiB` yanks whole file) |
| `ci,` | Change inside comma-separated |
| `cia` | Change inside argument |
| `ci)` | Change inside next parentheses |

## 🎨 Colorschemes

Switch colorschemes with `:colorscheme <name>`:

- `tokyonight` (default)
- `gruvbox-material`
- `catppuccin`
- `kanagawa`
- `everforest`
- `sonokai`
- `edge`
- `nightfox`
- `onedark`
- `material`
- `arctic`

## 📚 Commands

| Command | Description |
|---------|-------------|
| `:Lazy` | Open plugin manager |
| `:Mason` | Open LSP/tool installer |
| `:Vista` | Toggle tags sidebar |
| `:DiffviewOpen` | Open git diff view |
| `:FzfLua` | Open fzf-lua picker |
| `:Git` | Open fugitive git status |
| `:Rename {name}` | Rename current file |
| `:Delete` | Delete current file |
| `:AsyncRun {cmd}` | Run command async |

## 🗂️ File Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lazy-lock.json           # Plugin lock file
├── lazyvim.json             # LazyVim config
└── lua/
    ├── config/
    │   ├── autocmds.lua     # Auto commands
    │   ├── keymaps.lua      # Custom keymaps
    │   ├── lazy.lua         # Lazy.nvim setup
    │   └── options.lua      # Vim options
    └── plugins/
        ├── asyncrun.lua     # Async command execution
        ├── better-escape.lua # Fast insert mode escape
        ├── colorschemes.lua # Theme collection
        ├── diffview.lua     # Git diff viewer
        ├── dropbar.lua      # Breadcrumb navigation
        ├── fzf-lua.lua      # Fuzzy finder
        ├── git-conflict.lua # Conflict resolution
        ├── gitlinker.lua    # GitHub permalinks
        ├── hop.lua          # Cursor jump
        ├── mini-indentscope.lua # Indent indicator
        ├── nvim-bqf.lua     # Better quickfix
        ├── nvim-hlslens.lua # Search index
        ├── nvim-ufo.lua     # Code folding
        ├── smear_cursor.lua # Cursor animation
        ├── targets.lua      # Text objects
        ├── vim-eunuch.lua   # Unix commands
        ├── vim-fugitive.lua # Git integration
        ├── vim-sandwich.lua # Surround operations
        ├── vista.lua        # Tags sidebar
        ├── whitespace.lua   # Trailing whitespace
        └── yanky.lua        # Yank history
```

## 🔗 Credits

- [LazyVim](https://github.com/LazyVim/LazyVim) - Base configuration
- [jdhao/nvim-config](https://github.com/jdhao/nvim-config) - Feature inspiration
- [folke/lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager

## 📄 License

MIT License - See [LICENSE](./LICENSE) for details.
