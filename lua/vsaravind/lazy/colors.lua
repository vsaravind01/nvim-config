return {
    {
        "navarasu/onedark.nvim",
        name = "onedark",
        config = function()
            require("onedark").setup {
                style = "darker"
            }
            require("onedark").load()
            vim.g.terminal_color_4 = "#2742c5"
        end
    },
    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     name = "gruvbox",
    --     priority = 1000,
    --     config = function()
    --         require("gruvbox").setup({
    --             terminal_colors = true, -- add neovim terminal colors
    --             undercurl = true,
    --             underline = true,
    --             bold = true,
    --             italic = {
    --                 strings = true,
    --                 emphasis = true,
    --                 comments = true,
    --                 operators = false,
    --                 folds = true,
    --             },
    --             strikethrough = true,
    --             invert_selection = false,
    --             invert_signs = false,
    --             invert_tabline = false,
    --             invert_intend_guides = false,
    --             inverse = true, -- invert background for search, diffs, statuslines and errors
    --             contrast = "i", -- can be "hard", "soft" or empty string
    --             palette_overrides = {},
    --             overrides = {},
    --             dim_inactive = false,
    --             transparent_mode = false,
    --         })
    --         vim.cmd("colorscheme gruvbox")
    --     end
    -- }
}
