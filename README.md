# Michael's NixOS Configuration

Flake-based NixOS + Home Manager config for a single GNOME laptop, themed with Stylix.

## Layout

```txt
flake.nix                 # inputs + nixosConfigurations.laptop
hosts/laptop/
  configuration.nix       # boot, LUKS, hostname; picks the system modules
  hardware-configuration.nix
  nvidia.nix              # PRIME offload, bus IDs for this machine
  home.nix                # Home Manager entry; picks the home modules
modules/
  system/                 # NixOS modules (default.nix imports the shared set);
                          # theming.nix and gpg.nix also set the matching Home Manager options
  home/                   # Home Manager modules, one folder per area
    base/ cli/ dev/ applications/ gnome/
wallpapers/
```

Each folder's `default.nix` imports its files, so hosts import folders
(`../../modules/home/cli`). New module: add the file, list it in that folder's
`default.nix`.

## Usage

```bash
sudo nixos-rebuild switch --flake .#laptop   # apply
nixos-rebuild build --flake .#laptop         # build only
nix flake update                             # update inputs
nix fmt                                      # format all .nix files
```

GNOME keybindings: [modules/home/gnome/keybindings.nix](./modules/home/gnome/keybindings.nix).

## New host

1. `mkdir hosts/<name>` with `configuration.nix` and `home.nix` (copy the laptop ones).
2. `sudo nixos-generate-config --show-hardware-config > hosts/<name>/hardware-configuration.nix`
3. Add `nixosConfigurations.<name>` to `flake.nix`.
