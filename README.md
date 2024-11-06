# NixVim configuration as a home-manager module

1. Import NixVim module. If your system is already configured using flakes, just add the nixvim input:
    ```nix
    {
      inputs = {
        # ...
        nixvim = {
          url = "github:nix-community/nixvim";
          # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
          # url = "github:nix-community/nixvim/nixos-24.05";

          inputs.nixpkgs.follows = "nixpkgs";
        };
      };
    }
    ```
    The module is accessed using `inputs.nixvim.homeManagerModules.nixvim`.

    **WARNING:** Ensure to pass `inputs` as `extraSpecialArgs` within the home-manager configuration.
2. If you already manage your nix files with git, add the repository as a subtree:
    ```bash
    git subtree add --prefix=home/modules/nixvim https://github.com/aleddaheig/nixvim.git main --squash
    ```
3. **Alternative:** Clone as a standalone repository:
    ```bash
    cd /path/to/folder
    git clone https://github.com/aleddaheig/nixvim.git
    ```
4. Import the nixvim folder in home-manager main .nix configuration:
    ```nix
    { ... }:
    {
      imports = [
        # ...

        ./modules/nixvim
      ];
      # ...
    }
    ```    
