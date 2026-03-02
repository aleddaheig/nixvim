{ ... }:
{
  imports = [
    ./completion.nix
    ./keymappings.nix
    ./options.nix
    ./plugins
  ];

  defaultEditor = true;
  vimAlias = true;
  vimdiffAlias = true;
  luaLoader.enable = true;
}

