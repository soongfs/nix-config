{ ... }:

{
  networking.networkmanager.enable = true;
  networking.wireguard.enable = true;

  programs.clash-verge = {
    enable = true;
    serviceMode = true;
    tunMode = true;
  };

  networking.firewall = {
    trustedInterfaces = [ "Meta" ];
    checkReversePath = "loose";
    extraReversePathFilterRules = ''
      iifname { "Meta" } accept comment "clash tun"
    '';
  };
}
