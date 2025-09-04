# Calvin's Linux Dotfiles

This repository contains my personal Linux configuration files for Ubuntu with i3 window manager.

## Contents

### Window Manager & Desktop
- **i3**: Window manager configuration with custom keybindings
- **i3blocks**: Status bar configuration with custom scripts
- **GTK**: Custom theme modifications (quiet text selection colors)

### Shell & Terminal
- **bash**: Shell configuration and aliases
- **profile**: Environment variables and PATH configuration

### Development
- **git**: Git configuration with user settings

## File Structure

```
dotfiles/
├── config/                 # ~/.config/ files
│   ├── i3/
│   │   └── config         # i3 window manager config
│   ├── i3blocks/
│   │   ├── config         # i3blocks status bar config
│   │   └── scripts/       # Custom i3blocks scripts
│   ├── gtk-3.0/
│   │   └── gtk.css        # GTK3 custom styling
│   └── gtk-4.0/
│       └── gtk.css        # GTK4 custom styling
├── home/                   # ~/ files
│   ├── .bashrc            # Bash configuration
│   ├── .profile           # Shell profile
│   └── .gitconfig         # Git configuration
└── scripts/                # Utility scripts
```

## Installation

### Method 1: Manual Symbolic Links

```bash
# Clone the repository
git clone https://github.com/cchan282/dotfiles.git ~/dotfiles

# Create symbolic links
ln -sf ~/dotfiles/config/i3/config ~/.config/i3/config
ln -sf ~/dotfiles/config/i3blocks/config ~/.config/i3blocks/config
ln -sf ~/dotfiles/config/i3blocks/scripts ~/.config/i3blocks/scripts
ln -sf ~/dotfiles/config/gtk-3.0/gtk.css ~/.config/gtk-3.0/gtk.css
ln -sf ~/dotfiles/config/gtk-4.0/gtk.css ~/.config/gtk-4.0/gtk.css
ln -sf ~/dotfiles/home/.bashrc ~/.bashrc
ln -sf ~/dotfiles/home/.profile ~/.profile
ln -sf ~/dotfiles/home/.gitconfig ~/.gitconfig
```

### Method 2: Install Script (Coming Soon)

An automated install script will be added to make setup even easier.

## Features

### i3 Configuration
- Custom keybindings optimized for productivity
- Multi-monitor support
- Application shortcuts and window management

### i3blocks Status Bar
- CPU usage monitoring
- Memory usage display
- Disk space information
- Audio controls and switching
- Volume display

### Custom GTK Styling
- Quiet text selection colors (light gray instead of bright orange)
- Consistent across GTK3 and GTK4 applications

## Requirements

- Ubuntu (tested on latest LTS)
- i3 window manager
- i3blocks for status bar
- Standard GNU/Linux utilities

## Customization

Feel free to fork this repository and customize the configurations to your liking. The files are well-commented to help you understand what each setting does.

## Backup

Before installing, it's recommended to backup your existing configuration files:

```bash
mkdir ~/config-backup
cp -r ~/.config/i3 ~/config-backup/
cp -r ~/.config/i3blocks ~/config-backup/
cp ~/.bashrc ~/config-backup/
cp ~/.profile ~/config-backup/
cp ~/.gitconfig ~/config-backup/
```

## Contributing

If you find improvements or have suggestions, feel free to open an issue or submit a pull request!

## License

This project is licensed under the MIT License - feel free to use and modify as needed.
