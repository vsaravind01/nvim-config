return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'right_align',
                delay = 500,
                ignore_whitespace = false,
                virt_text_priority = 100,
                use_focus = true,
            }
        })
    end
}
