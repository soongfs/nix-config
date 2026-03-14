# Nix Config

A structured Nix flake for:

- `nixos-tuf` (physical machine)
- `nixos-wsl` (WSL)
- `Soongs-Mac-mini` (nix-darwin)

## Layout

- `hosts/`: host-specific entry points and hardware files
- `modules/shared/`: shared base settings (locale, nix settings)
- `modules/darwin/core/`: nix-darwin common base (host, user, home-manager wiring, gc)
- `modules/nixos/core/`: NixOS common base (users, home-manager user wiring, nix-ld, xdg, unfree)
- `modules/nixos/features/`: composable feature modules
- `modules/nixos/presets/`: scenario presets (`desktop`, `wsl`)
- `home/modules/`: composable Home Manager modules
- `home/presets/`: Home Manager presets (`base`, `linux-base`, `desktop`)

## Build

```sh
sudo nixos-rebuild switch --flake .#nixos-tuf
sudo nixos-rebuild switch --flake .#nixos-wsl
darwin-rebuild switch --flake .#Soongs-Mac-mini
```

`Soongs-Mac-mini` currently uses the shared CLI/dev/editor base only. Desktop-specific modules remain Linux-only.
