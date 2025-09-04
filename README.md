# calvin's linux dotfiles

this repository contains my personal linux configuration files for ubuntu with i3 window manager.

## contents

### window manager & desktop
- **i3**: window manager configuration with custom keybindings
- **i3blocks**: status bar configuration with custom scripts
- **gtk**: custom theme modifications (quiet text selection colors)

### shell & terminal
- **bash**: shell configuration and aliases
- **profile**: environment variables and path configuration

### development
- **git**: git configuration with user settings

## file structure

```
dotfiles/
├── config/                 # ~/.config/ files
│   ├── i3/
│   │   └── config         # i3 window manager config
│   ├── i3blocks/
│   │   ├── config         # i3blocks status bar config
│   │   └── scripts/       # custom i3blocks scripts
│   ├── gtk-3.0/
│   │   └── gtk.css        # gtk3 custom styling
│   └── gtk-4.0/
│       └── gtk.css        # gtk4 custom styling
├── home/                   # ~/ files
│   ├── .bashrc            # bash configuration
│   ├── .profile           # shell profile
│   └── .gitconfig         # git configuration
└── scripts/                # utility scripts
```

## installation

### method 1: manual symbolic links

```bash
# clone the repository
git clone https://github.com/cchan282/dotfiles.git ~/dotfiles

# create symbolic links
ln -sf ~/dotfiles/config/i3/config ~/.config/i3/config
ln -sf ~/dotfiles/config/i3blocks/config ~/.config/i3blocks/config
ln -sf ~/dotfiles/config/i3blocks/scripts ~/.config/i3blocks/scripts
ln -sf ~/dotfiles/config/gtk-3.0/gtk.css ~/.config/gtk-3.0/gtk.css
ln -sf ~/dotfiles/config/gtk-4.0/gtk.css ~/.config/gtk-4.0/gtk.css
ln -sf ~/dotfiles/home/.bashrc ~/.bashrc
ln -sf ~/dotfiles/home/.profile ~/.profile
ln -sf ~/dotfiles/home/.gitconfig ~/.gitconfig
```

### method 2: install script (coming soon)

an automated install script will be added to make setup even easier.

## features

### i3 configuration
- custom keybindings optimized for productivity
- multi-monitor support
- application shortcuts and window management

### i3blocks status bar
- cpu usage monitoring
- memory usage display
- disk space information
- audio controls and switching
- volume display

### custom gtk styling
- quiet text selection colors (light gray instead of bright orange)
- consistent across gtk3 and gtk4 applications

## requirements

- ubuntu (tested on latest lts)
- i3 window manager
- i3blocks for status bar
- standard gnu/linux utilities

## customization

feel free to fork this repository and customize the configurations to your liking. the files are well-commented to help you understand what each setting does.

## backup

before installing, it's recommended to backup your existing configuration files:

```bash
mkdir ~/config-backup
cp -r ~/.config/i3 ~/config-backup/
cp -r ~/.config/i3blocks ~/config-backup/
cp ~/.bashrc ~/config-backup/
cp ~/.profile ~/config-backup/
cp ~/.gitconfig ~/config-backup/
```

## contributing

if you find improvements or have suggestions, feel free to open an issue or submit a pull request!
