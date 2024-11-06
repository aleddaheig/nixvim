{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./completion.nix
    ./keymappings.nix
    ./options.nix
    ./plugins
  ];

  home.shellAliases.v = "nvim";

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;
  };
}
