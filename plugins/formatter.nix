{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      gofumpt
      goimports-reviser
      golines
      prettierd
    ];

    plugins.conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          go = [
            "gofumpt"
            "goimports-reviser"
            "golines"
          ];
          javascript = [ "prettierd" ];
          typescript = [ "prettierd" ];

          php = [ "pint" ];
        };
        format_on_save = {
          timeout_ms = 500;
          lsp_fallback = true;
        };
        notify_on_error = true;
        notify_no_formatters = true;
      };
    };
  };
}
