{
  programs.nixvim = {
    plugins = {
      dap.enable = true;
      dap-go.enable = true;
      dap-ui.enable = true;
      dap-virtual-text.enable = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>du";
        action = "<cmd>lua local widgets=require('dap.ui.widgets');widgets.sidebar(widgets.scopes).open()<CR>";
        options = {
          silent = true;
          desc = " Dap UI";
        };
      }
      {
        mode = "n";
        key = "<leader>dc";
        action = "<cmd>lua require('dap').continue()<CR>";
        options = {
          silent = true;
          desc = "Continue";
        };
      }
      {
        mode = "n";
        key = "<leader>db";
        action = "<cmd>lua require('dap').toggle_breakpoint()<CR>";
        options = {
          silent = true;
          desc = "Toggle Breakpoint";
        };
      }
      {
        mode = "n";
        key = "<leader>di";
        action = "<cmd>lua require('dap').step_into()<CR>";
        options = {
          silent = true;
          desc = "Step Into";
        };
      }
      {
        mode = "n";
        key = "<leader>do";
        action = "<cmd>lua require('dap').step_out()<CR>";
        options = {
          silent = true;
          desc = "Step Out";
        };
      }
      {
        mode = "n";
        key = "<leader>dv";
        action = "<cmd>lua require('dap').step_over()<CR>";
        options = {
          silent = true;
          desc = "Step Over";
        };
      }
      {
        mode = "n";
        key = "<leader>dr";
        action = "<cmd>lua require('dap').repl.open()<CR>";
        options = {
          silent = true;
          desc = "REPL";
        };
      }
      {
        mode = "n";
        key = "<leader>dl";
        action = "<cmd>lua require('dap').run_last()<CR>";
        options = {
          silent = true;
          desc = "Run Last";
        };
      }
      {
        mode = "n";
        key = "<leader>dgt";
        action = "<cmd>lua require('dap-go').debug_test()<CR>";
        options = {
          silent = true;
          desc = "Debug Go Test";
        };
      }
      {
        mode = "n";
        key = "<leader>dgl";
        action = "<cmd>lua require('dap-go').debug_last()<CR>";
        options = {
          silent = true;
          desc = "Debug Last Go Test";
        };
      }
    ];
  };
}
