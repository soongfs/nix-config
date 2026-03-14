{ hostName, ... }:

{
  networking = {
    hostName = hostName;
    computerName = hostName;
    localHostName = hostName;
  };

  system.stateVersion = 6;
}
