return  {
  "nvim-treesitter/nvim-treesitter",
  enabled = require('nixCatsUtils').lazyAdd(true, false),
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

