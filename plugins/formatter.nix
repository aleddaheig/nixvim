{ pkgs, lib, ... }:
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
          timeoutMs = "500";
        };
        notify_on_error = true;
        notify_no_formatters = true;
      };
    };
  };
}
