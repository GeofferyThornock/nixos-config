return {

    "nvim-lualine/lualine.nvim",
    config = function()
    local lualine = require("lualine")


    local diff = {
        "diff",
        source = function()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
                return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                }
            end
        end,
        symbols = {
            added = "+",
            modified = "-",
            removed = "x",
        },
        colored = true,
        always_visible = false,
    }

    lualine.setup({
        options = {
            theme = "auto",
            globalstatus = true,
            section_separators = "",
            component_separators = "|",
            disabled_filetypes = { "mason", "lazy", "NvimTree" },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = {},
            lualine_c = { "filename", "codecompanion", "supermaven" },
            lualine_x = { diff },
            lualine_y = { 'progress', 'location' },
            lualine_z = {},
        },
    })
    end
  }
