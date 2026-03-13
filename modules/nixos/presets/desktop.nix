{ ... }:

{
  imports = [
    ../features/boot/grub-efi.nix
    ../features/desktop/niri.nix
    ../features/hardware/bluetooth.nix
    ../features/hardware/fonts.nix
    ../features/hardware/touchpad.nix
    ../features/network/desktop.nix
    ../features/services/pipewire.nix
    ../features/services/power.nix
    ../features/services/printing.nix
    ../features/system/swapfile.nix
  ];
}
