{
  plugins.dap = {
    enable = true;
    extensions = {
      dap-go.enable = true;
      dap-ui.enable = true;
      dap-virtual-text.enable = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>d";
      action = "???";
      options = {
        silent = true;
        desc = "  Dap";
      };
    }

    {
      mode = "n";
      key = "<leader>dc";
      action = "<cmd>lua function() require('dap').continue()<CR>";
      #    lua = true;
      options = {
        silent = true;
        desc = "Continue";
      };
    }

    {
      mode = "n";
      key = "<leader>db";
      action = "<cmd>lua require('dap').toggle_breakpoint()<CR>";
      #    lua = true;
      options = {
        silent = true;
        desc = "Toggle Breakpoint";
      };
    }

    {
      mode = "n";
      key = "<leader>di";
      action = "<cmd>lua require('dap').step_into()<CR>";
      #    lua = true;
      options = {
        silent = true;
        desc = "Step Into";
      };
    }

    {
      mode = "n";
      key = "<leader>do";
      action = "<cmd>lua require('dap').step_out()<CR>";
      #    lua = true;
      options = {
        silent = true;
        desc = "Step Out";
      };
    }

    {
      mode = "n";
      key = "<leader>dv";
      action = "<cmd>lua function() require('dap').step_over()<CR>";
      #    lua = true;
      options = {
        silent = true;
        desc = "Step Over";
      };
    }

    {
      mode = "n";
      key = "<leader>dr";
      action = "<cmd>lua function() require('dap').repl.open()<CR>";
      #    lua = true;
      options = {
        silent = true;
        desc = "Repl";
      };
    }

    {
      mode = "n";
      key = "<leader>dl";
      action = "<cmd>lua function() require('dap').run_last()<CR>";
      #    lua = true;
      options = {
        silent = true;
        desc = "Run Last";
      };
    }
  ];
}
