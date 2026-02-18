# Michael's NixOS Configuration

A modular, flake-based NixOS configuration with home-manager integration, featuring Hyprland as the desktop environment and comprehensive system and user package management.

## Features

- **Flake-based**: Uses Nix flakes for reproducible builds and dependency management
- **Modular architecture**: Organized into reusable modules for system and home configurations
- **Hyprland desktop**: Modern Wayland compositor with custom keybindings and theming
- **Stylix integration**: Unified theming across applications
- **Security-focused**: Includes firewall, GPG, and polkit configurations
- **Development tools**: Pre-configured development environment with multiple languages

## Structure

```txt
.
├── flake.nix                # Main flake definition
├── flake.lock               # Locked dependency versions
├── hosts/                   # Host-specific configurations
│   └── laptop/
│       ├── configuration.nix    # System configuration
│       ├── hardware-configuration.nix
│       └── home.nix            # User configuration
├── modules/                 # Reusable configuration modules
│   ├── home/               # Home-manager modules
│   │   ├── apps/          # Application configurations
│   │   ├── base/          # Core user settings
│   │   ├── dev-tools/     # Development tools
│   │   ├── hypr/          # Hyprland ecosystem
│   │   └── system-tools/  # System utilities
│   └── system/            # NixOS system modules
│       ├── desktop/       # Desktop environments
│       └── [other]/       # System services
└── wallpapers/            # Desktop wallpapers
└── templates/             # For dev shells
```

## Installation

1. **Clone the repository**:

    ```bash
    https://github.com/ObernhumerMichael/nixos-config.git
    cd nixos-config
    ```

2. **Copy hardware configuration** (if setting up a new host):

    ```bash
    sudo nixos-generate-config --show-hardware-config > hosts/newhost/hardware-configuration.nix
    ```

3. **Update flake.nix** for your new host configuration

4. **Build and switch**:

   ```bash
   sudo nixos-rebuild switch --flake .#hostname
   ```

## Usage

### Rebuilding the system

```bash
# For the laptop host
sudo nixos-rebuild switch --flake .#laptop

# Dry run to check for errors
sudo nixos-rebuild dry-run --flake .#laptop
```

### Updating the flake

```bash
# Update all inputs
nix flake update

# Update specific input
nix flake lock --update-input nixpkgs
```

## Key Bindings (Hyprland)

See the [keybindings](./modules/home/hypr/base/keybindings.nix) file.

## Customization

### Theming

The configuration uses Stylix for unified theming. To change themes:

1. Modify `modules/home/base/stylix.nix` or `modules/system/stylix.nix`
2. Rebuild the system

### Adding new software

- **System packages**: Add to relevant module in `modules/system/`
- **User packages**: Add to relevant module in `modules/home/`
- **Custom packages**: Create overlays in `flake.nix`

### New host setup

1. Create new directory in `hosts/`
2. Add configuration.nix and home.nix
3. Update flake.nix outputs
4. Generate hardware config

## Maintenance

### Troubleshooting

- Check system logs: `journalctl -u nixos-rebuild`
- Test configuration: `nixos-rebuild test --flake .#hostname`
- Rollback: `sudo nixos-rebuild switch --rollback`

## Development

### Adding new modules

1. Create new .nix file in appropriate module directory
2. Import it in the parent module's common.nix
3. Add configuration options

### Testing changes

```bash
# Check flake syntax
nix flake check

# Build without switching
nixos-rebuild build --flake .#hostname
```

## Dependencies

- **NixOS unstable** - Latest packages and features
- **Home Manager** - User environment management
- **Stylix** - Theming system
- **Spicetify** - Spotify customization

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This configuration is provided as-is. Feel free to use and modify for your own setup.

## Acknowledgments

- NixOS community for the excellent operating system
- Home Manager project for user environment management
- Hyprland community for the desktop environment
- Various NixOS modules and flakes used throughout the project
