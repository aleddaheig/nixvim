{ ... }:
{
  imports = [
    ./completion.nix
    ./keymappings.nix
    ./options.nix
    ./plugins
  ];

  nixpkgs.config.allowUnfree = true;

  defaultEditor = true;
  vimAlias = true;
  vimdiffAlias = true;
  luaLoader.enable = true;
}

