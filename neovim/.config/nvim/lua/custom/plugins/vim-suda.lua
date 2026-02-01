return {
  'lambdalisue/vim-suda',
  lazy = false,  -- Load on startup if you want smart_edit to work immediately
  config = function()
    vim.g.suda_smart_edit = 1  -- Automatically use suda:// for unreadable/unwritable files
  end,
}
