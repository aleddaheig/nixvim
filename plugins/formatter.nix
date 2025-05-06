{ pkgs, lib, ... }:
{
  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;
      settings = {
        formattersByFt = {
          javascript = [ "${lib.getExe pkgs.prettierd}" ];
          typescript = [ "${lib.getExe pkgs.prettierd}" ];
          php = [ "pint" ];
        };
        formatOnSave = {
          lspFormat = "fallback";
          timeoutMs = "500";
        };
        notifyOnError = true;
        notifyNoFormatters = true;
      };
    };
  };
}
