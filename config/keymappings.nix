{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = [
      {
        mode = "n";
        key = "<C-b>";
        action = "<C-v>";
        options = {
          noremap = true;
          silent = true;
        };
      }
    ];
  };
}
