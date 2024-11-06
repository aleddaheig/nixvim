{
  imports = [ ./lsp.nix ];

  programs.nixvim = {
    colorschemes.vscode.enable = true;

    plugins = {
      nvim-autopairs.enable = true;

      nvim-colorizer = {
        enable = true;
        userDefaultOptions.names = false;
      };

      oil.enable = true;
    };
  };
}
