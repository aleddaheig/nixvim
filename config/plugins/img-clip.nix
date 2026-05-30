{
  plugins.img-clip = {
    enable = true;
    settings = {
      default = {
        dir_path = "assets";
        file_name = "%Y-%m-%d-%H-%M-%S";
        extension = "png";
        prompt_for_file_name = true;
        show_dir_path_in_prompt = true;
        insert_mode_after_paste = true;
      };
      filetypes = {
        markdown = {
          url_encode_path = true;
          template = "![$CURSOR]($FILE_PATH)";
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>p";
      action = "<cmd>PasteImage<cr>";
      options.desc = "Paste image from clipboard";
    }
  ];
}
