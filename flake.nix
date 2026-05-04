{
  description = "My NixVim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      nixvim,
      ...
    }:
    let
      system = "x86_64-linux";

      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };

    in
    {
      # Export as a package
      packages.${system}.default = nixvim.legacyPackages.${system}.makeNixvimWithModule {
        module = {
          imports = [ ./config ];
          nixpkgs.config.allowUnfree = true;
        };
      };

      # Export as a home-manager module
      homeModules.default =
        { ... }:
        {
          imports = [ nixvim.homeModules.nixvim ];
          programs.nixvim = {
            enable = true;
            vimAlias = true;
            vimdiffAlias = true;
            defaultEditor = true;
            imports = [ ./config ];
          };
        };

      # Export as a NixOS module
      nixosModules.default =
        { ... }:
        {
          imports = [ nixvim.nixosModules.nixvim ];
          programs.nixvim = {
            enable = true;
            vimAlias = true;
            vimdiffAlias = true;
            defaultEditor = true;
            imports = [ ./config ];
          };
        };
    };
}
