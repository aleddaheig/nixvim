{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "-";
        action = "<cmd>Oil<cr>";
        options.desc = "Open parent directory";
      }
    ];

    plugins.oil = {
      enable = true;
      settings = {
        view_options.show_hidden = true;
        keymaps = {
          "<C-p>" = false;
          "<leader>qq" = "actions.close";
          "<leader>p" = "actions.preview";
        };
        skip_confirm_for_simple_edits = true;
      };
    };
  };
}
