{
  pkgs,
  lib,
  ...
}:
{
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
          package = pkgs.nixd;
          settings = {
            nixpkgs.expr = "import ${pkgs.path} { }";
            formatting.command = [ "${lib.getExe pkgs.nixfmt}" ];
            options.nixos.expr = ''
              (let pkgs = import ${pkgs.path} { }; in (pkgs.lib.evalModules {
                modules = (import "${pkgs.path}/nixos/modules/module-list.nix") ++
                  [ ({...}: { nixpkgs.hostPlatform = builtins.currentSystem; }) ];
              })).options
            '';
          };
        };

        # PHP
        intelephense = {
          enable = true;
          package = pkgs.intelephense;
          settings.intelephense.format.enable = false;
        };

        # Golang — also add pkgs.go to extraPackages (see note below)
        gopls = {
          enable = true;
          package = pkgs.gopls;
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
          settings.gopls.completeUnimported = true;
        };

        # TS/JS
        ts_ls = {
          enable = true;
          package = pkgs.typescript-language-server;
        };

        # ESLint
        eslint = {
          enable = true;
          package = pkgs.vscode-langservers-extracted;
        };

        # CSS
        cssls = {
          enable = true;
          package = pkgs.vscode-langservers-extracted;
        };

        # TailwindCSS
        tailwindcss = {
          enable = true;
          package = pkgs.tailwindcss-language-server;
        };

        # HTML
        html = {
          enable = true;
          package = pkgs.vscode-langservers-extracted;
        };

        # Docker
        dockerls = {
          enable = true;
          package = pkgs.dockerfile-language-server-nodejs;
        };

        # Docker Compose
        docker_compose_language_service = {
          enable = true;
          package = pkgs.docker-compose-language-service;
          filetypes = [
            "yml"
            "yaml"
            "yaml.docker-compose"
          ];
        };

        # Bash
        bashls = {
          enable = true;
          package = pkgs.bash-language-server;
        };

        # C/C++
        clangd = {
          enable = true;
          package = pkgs.clang-tools; # clangd is bundled inside clang-tools
        };

        # Python
        pyright = {
          enable = true;
          package = pkgs.pyright;
        };

        # Java
        java_language_server = {
          enable = true;
          package = pkgs.java-language-server;
        };

        # Markdown
        markdown_oxide = {
          enable = true;
          package = pkgs.markdown-oxide;
        };
      };
    };
  };

  # gopls requires Go to be present at runtime
  extraPackages = [ pkgs.go ];
}
