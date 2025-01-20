return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        local tt = require("toggleterm")

        tt.setup({
            direction = 'float',
            float_opts = {
                border = 'rounded'
            }
        })
    end
}
