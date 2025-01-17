local ts_builtin = require('telescope.builtin')
local wk = require("which-key")
local gs = require("gitsigns")

wk.add(
{
    {
        "<leader>?",
        function()
            require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
    },
    {
        "<leader>e",
        "<cmd>NvimTreeToggle<cr>",
        mode="n",
        desc = "File Explorer",
    },

    -- GITSIGNS KEYMAP
    {
        "<leader>gj",
        function()
            gs.next_hunk()
        end,
        mode="n",
        desc="Next hunk"
    },
    {
        "<leader>gk",
        function()
            gs.prev_hunk()
        end,
        mode="n",
        desc="Prev hunk"
    },
    {
        "<leader>gs",
        function()
            gs.stage_hunk()
        end,
        mode="n",
        desc="Stage hunk"
    },
    {
        "<leader>gS",
        function()
            gs.stage_buffer()
        end,
        mode="n",
        desc="Stage buffer"
    },
    {
        "<leader>gu",
        function()
            gs.undo_stage_hunk()
        end,
        mode="n",
        desc="Undo stage hunk"
    },
    {
        "<leader>gb",
        function()
            gs.blame_line()
        end,
        mode="n",
        desc="Blame line"
    },
    {
        "<leader>gt",
        function()
            gs.toggle_current_line_blame()
        end,
        mode="n",
        desc="Toggle current blame line"
    },

    -- TELESCOPE REMAPS
    {
        "<leader>pf", 
        ts_builtin.find_files, 
        mode="n", 
        desc="Find files"
    },
    {
        "<leader>ps",
        function()
            ts_builtin.grep_string({ search = vim.fn.input("Grep >") })
        end,
        mode="n",
        desc="Grep string"
    },
    {
        "<leader>pws",
        function()
            local word = vim.fn.expand("cword")
            ts_builtin.grep_string({ search = word })
        end,
        mode="n",
        desc="Find in files"
    },
    {
        "<C-g>",
        ts_builtin.git_files,
        mode="n",
        desc="Find git files"
    },
    {
        "<leader>vh",
        ts_builtin.help_tags,
        mode="n",
        desc="Open help tags"
    }
})
