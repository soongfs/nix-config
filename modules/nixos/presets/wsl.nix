{ username, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = username;
  wsl.interop.register = true;
}
