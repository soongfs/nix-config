{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./options.nix
    ./editor.nix
    ./navigation.nix
    ./ui.nix
    ./completion.nix
    ./lsp.nix
  ];
}
