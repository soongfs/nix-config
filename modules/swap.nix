{ ... }:

{
  boot.initrd.systemd.enable = true;
  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 65536;
  }];
}
