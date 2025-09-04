#!/bin/bash

# Calvin's Dotfiles Installation Script
echo "🚀 Installing Calvin's dotfiles..."

# Get the directory where this script is located
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Function to create backup of existing file
backup_file() {
    if [ -f "$1" ] || [ -L "$1" ]; then
        echo "📦 Backing up $1 to $1.backup"
        mv "$1" "$1.backup"
    fi
}

# Function to create directories if they don't exist
ensure_dir() {
    if [ ! -d "$1" ]; then
        echo "📁 Creating directory: $1"
        mkdir -p "$1"
    fi
}

echo "📂 Setting up directories..."
ensure_dir ~/.config/i3
ensure_dir ~/.config/i3blocks
ensure_dir ~/.config/gtk-3.0
ensure_dir ~/.config/gtk-4.0

echo "💾 Creating backups of existing configs..."
backup_file ~/.config/i3/config
backup_file ~/.config/i3blocks/config
backup_file ~/.config/i3blocks/scripts
backup_file ~/.config/gtk-3.0/gtk.css
backup_file ~/.config/gtk-4.0/gtk.css
backup_file ~/.bashrc
backup_file ~/.profile
backup_file ~/.gitconfig

echo "🔗 Creating symbolic links..."
ln -sf "$DOTFILES_DIR/config/i3/config" ~/.config/i3/config
ln -sf "$DOTFILES_DIR/config/i3blocks/config" ~/.config/i3blocks/config
ln -sf "$DOTFILES_DIR/config/i3blocks/scripts" ~/.config/i3blocks/scripts
ln -sf "$DOTFILES_DIR/config/gtk-3.0/gtk.css" ~/.config/gtk-3.0/gtk.css
ln -sf "$DOTFILES_DIR/config/gtk-4.0/gtk.css" ~/.config/gtk-4.0/gtk.css
ln -sf "$DOTFILES_DIR/home/.bashrc" ~/.bashrc
ln -sf "$DOTFILES_DIR/home/.profile" ~/.profile
ln -sf "$DOTFILES_DIR/home/.gitconfig" ~/.gitconfig

echo "✅ Installation complete!"
echo ""
echo "📋 Next steps:"
echo "1. Restart your shell or run: source ~/.bashrc"
echo "2. Restart i3 (Mod+Shift+R) to apply window manager changes"
echo "3. Restart applications to see GTK theme changes"
echo ""
echo "💡 If you want to revert changes, your original files are backed up with .backup extension"
