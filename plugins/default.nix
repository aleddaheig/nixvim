{ pkgs, ... }:
{
  imports = [
    ./dap.nix
    ./formatter.nix
    ./go.nix
    ./lsp.nix
    ./markdown-preview.nix
    ./oil.nix
    ./telescope.nix
    ./treesitter.nix
  ];

  programs.nixvim = {
    colorschemes.base16.enable = true;
    colorschemes.base16.colorscheme = "material";

    plugins = {
      nvim-autopairs.enable = true;

      colorizer = {
        enable = true;
      };
    };

  };
}
