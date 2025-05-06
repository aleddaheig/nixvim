{
  pkgs,
  lib,
  self,
  ...
}:
{
  programs.nixvim = {
    plugins = {
      lsp-format = {
        enable = true;
        lspServersToEnable = "all";
      };

      lsp = {
        enable = true;
        inlayHints = true;

        keymaps = {
          silent = true;
          diagnostic = {
            # Navigate in diagnostics
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = {
              action = "definition";
              desc = "Goto Definition";
            };
            gr = {
              action = "references";
              desc = "Goto References";
            };
            gD = {
              action = "declaration";
              desc = "Goto Declaration";
            };
            gi = {
              action = "implementation";
              desc = "Goto Implementation";
            };
            gt = {
              action = "type_definition";
              desc = "Type Definition";
            };
            K = "hover";
            "<F2>" = "rename";
          };
        };

        servers = {
          # NIX
          nixd = {
            enable = true;
            settings =
              let
                flake = ''(builtins.getFlake "${self}")'';
              in
              {
                nixpkgs = {
                  expr = "import ${flake}.inputs.nixpkgs { }";
                };
                formatting = {
                  command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
                };
              };
          };

          # PHP
          intelephense = {
            enable = true;
            package = pkgs.intelephense;
          };

          # Golang
          gopls = {
            enable = true;
            filetypes = [
              "go"
              "gomod"
              "gowork"
              "gotmpl"
            ];
            rootMarkers = [
              "go.work"
              "go.mod"
            ];
            settings = {
              gopls = {
                completeUnimported = true;
              };
            };
          };
          ts_ls.enable = true; # TS/JS
          eslint.enable = true; # Eslint
          cssls.enable = true; # CSS
          tailwindcss.enable = true; # TailwindCSS
          html.enable = true; # HTML
          dockerls.enable = true; # Docker
          bashls.enable = true; # Bash
          clangd.enable = true; # C/C++
          vuels.enable = false; # Vue
          pyright.enable = true; # Python
          java_language_server.enable = true; # Java
        };
      };
    };
  };
}
