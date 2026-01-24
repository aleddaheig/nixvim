{
  description = "My NixVim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixvim,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      # Export as a package
      packages.${system}.default = nixvim.legacyPackages.${system}.makeNixvimWithModule {
        inherit pkgs;
        module = ./config; # Your nixvim config directory
      };

      # Export as a home-manager module
      homeModules.default =
        { pkgs, ... }:
        {
          imports = [ nixvim.homeModules.nixvim ];
          programs.nixvim = {
            enable = true;
            # Import your configuration
            imports = [ ./config ];
          };
        };

      # Export as a NixOS module (optional)
      nixosModules.default =
        { pkgs, ... }:
        {
          imports = [ nixvim.nixosModules.nixvim ];
          programs.nixvim = {
            enable = true;
            imports = [ ./config ];
          };
        };
    };
}
