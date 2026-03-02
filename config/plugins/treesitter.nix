{ pkgs, ... }:
{
  plugins = {
    treesitter = {
      enable = true;

      nixvimInjections = true;

      settings = {
        highlight.enable = true;
        indent.enable = true;
      };

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        json
        make
        markdown
        nix
        regex
        xml
        yaml
        go
        java
        javascript
        typescript
        php
        css
        dockerfile
        html
        python
        cpp
        c
        lua
      ];
    };

    treesitter-refactor = {
      enable = true;
      settings = {
        highlight_definitions = {
          enable = true;
          clear_on_cursor_move = false;
        };
      };
    };

    # hmts brings in nixpkgs' nvim-treesitter as a propagated dep, conflicting
    # with nixvim's own treesitter. Disabled until resolved upstream.
    # hmts.enable = true;
  };
}
