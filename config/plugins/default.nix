{ pkgs, ... }:
{
  imports = [
    ./dap.nix
    ./formatter.nix
    #./go.nix
    ./lsp.nix
    ./markdown-preview.nix
    ./oil.nix
    ./telescope.nix
    ./treesitter.nix
  ];

  colorschemes.base16.enable = true;
  colorschemes.base16.colorscheme = "material";

  plugins = {
    nvim-autopairs.enable = true;

    # ts-autotag pulls in nixpkgs' nvim-treesitter via propagatedBuildInputs,
    # conflicting with nixvim's own treesitter version.
    # ts-autotag.enable = true;

    which-key.enable = true;

    colorizer = {
      enable = true;
    };
  };
}
