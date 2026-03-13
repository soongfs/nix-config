# Nix Config

A structured Nix flake for:

- `nixos-tuf` (physical machine)
- `nixos-wsl` (WSL)

## Layout

- `hosts/`: host-specific entry points and hardware files
- `modules/shared/`: shared base settings (locale, nix settings)
- `modules/nixos/core/`: NixOS common base (users, home-manager user wiring, nix-ld, xdg, unfree)
- `modules/nixos/features/`: composable feature modules
- `modules/nixos/presets/`: scenario presets (`desktop`, `wsl`)
- `home/modules/`: composable Home Manager modules
- `home/presets/`: Home Manager presets (`base`, `desktop`)

## Build

```sh
sudo nixos-rebuild switch --flake .#nixos-tuf
sudo nixos-rebuild switch --flake .#nixos-wsl
```
