return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = {"dockerfile", "php", "lua", "javascript", "elm", "html", "yaml", "haskell", "make"},
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
