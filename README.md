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
- `home/presets/`: Home Manager presets (`base`, `linux-base`, `darwin-base`, `desktop`)

## Build

```sh
sudo nixos-rebuild switch --flake .#nixos-tuf
sudo nixos-rebuild switch --flake .#nixos-wsl
darwin-rebuild switch --flake .#Soongs-Mac-mini
```

`Soongs-Mac-mini` currently uses the shared CLI/dev/editor base plus Colima/Docker tooling and a minimal Forgejo compose stack. Desktop-specific modules remain Linux-only.

## Darwin Containers

`Soongs-Mac-mini` installs `colima`, `docker`, and `docker-compose` through Home Manager.

For Forgejo on macOS:

```sh
colima start
forgejo-up
```

Then open `http://localhost:3000`.

Useful commands:

```sh
forgejo-ps
forgejo-logs
forgejo-down
```

SSH for Git is exposed on `localhost:2222`.
