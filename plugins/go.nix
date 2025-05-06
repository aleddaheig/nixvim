{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        pname = "gopher-nvim";
        version = "2024-05-06";
        src = pkgs.fetchFromGitHub {
          owner = "olexsmir";
          repo = "gopher.nvim";
          rev = "main";
          sha256 = "sha256-gxiD5y+uhGSTxE4td3Zhlns4wvJAbMdRSmB2/BZnQaA=";
        };
      })
    ];

    keymaps = [
      {
        mode = "n";
        key = "<leader>gsj";
        action = "<cmd> GoTagAdd json <CR>";
        options = {
          silent = true;
          desc = "Add json struct tags";
        };
      }

      {
        mode = "n";
        key = "<leader>gsy";
        action = "<cmd> GoTagAdd yaml <CR>";
        options = {
          silent = true;
          desc = "Add yaml struct tags";
        };
      }
    ];
  };
}
