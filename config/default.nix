{ ... }:
{
  imports = [
    ./completion.nix
    ./keymappings.nix
    ./options.nix
    ./plugins
  ];

  nixpkgs.config.allowUnfree = true;

  luaLoader.enable = true;

  autoCmd = [
    {
      event = "BufRead";
      pattern = "*.sage";
      command = "set filetype=python";
    }
  ];
}
