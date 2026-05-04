{ unstable, ... }:
{
  # Zig syntax/filetype support (equivalent to Plug('ziglang/zig.vim'))
  extraPlugins = [ unstable.vimPlugins.zig-vim ];

  extraConfigLua = ''
    -- Disable zig.vim's built-in parse error window and format-on-save
    -- (we let ZLS/lsp-format handle formatting instead)
    vim.g.zig_fmt_parse_errors = 0
    vim.g.zig_fmt_autosave = 0
  '';

  # ZLS settings (equivalent to zls.json: enable_build_on_save + build_on_save_step)
  plugins.lsp.servers.zls.settings = {
    semantic_tokens = "partial";
    enable_build_on_save = true;
    build_on_save_step = "check";
  };
}
