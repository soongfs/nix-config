# Nix Config

My Nix configuration.

## How to build

- ASUS TUF Gaming A15

  ```sh
  sudo nixos-rebuild switch --flake .#nixos-tuf
  ```

- WSL

  ```sh
  sudo nixos-rebuild switch --flake .#nixos-wsl
  ```
