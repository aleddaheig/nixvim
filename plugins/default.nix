{
  imports = [
    ./lsp.nix
    ./markdown-preview.nix
    ./oil.nix
    ./treesitter.nix
  ];

  programs.nixvim = {
    colorschemes.vscode.enable = true;

    plugins = {
      nvim-autopairs.enable = true;

      colorizer = {
        enable = true;
        userDefaultOptions.names = false;
      };

    };

  };
}
