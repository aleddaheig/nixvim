{ inputs, ... }:
{
  # Import all your configuration modules here
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];
}
