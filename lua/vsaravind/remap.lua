local ts_builtin = require('telescope.builtin')
local wk = require("which-key")
local gs = require("gitsigns")
local conform = require("conform")

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

wk.add(
{
    {
        "<leader>?",
        function()
            require("which-key").show({ global = false })
        end,
        desc="Buffer Local Keymaps (which-key)",
    },
    {
        "<leader>e",
        "<cmd>NvimTreeToggle<cr>",
        mode="n",
        desc="File Explorer",
    },
    {
        "<leader>n",
        "<cmd>noh<cr>",
        mode="n",
        desc="Clear Highlight"
    },

    -- GITSIGNS KEYMAP
    {
        "<leader>gj",
        function()
            gs.nav_hunk('next')
        end,
        mode="n",
        desc="Next hunk"
    },
    {
        "<leader>gk",
        function()
            gs.nav_hunk('prev')
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
            ts_builtin.live_grep()
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
        "<leader>gf",
        function()
            ts_builtin.git_files({ git_command = {"git", "ls-files", "-m"} })
        end,
        mode="n",
        desc="Find git modified files"
    },
    {
        "<leader>vh",
        ts_builtin.help_tags,
        mode="n",
        desc="Open help tags"
    },
    -- FORMATTERS
    {
        "<leader>pa",
        function()
            conform.format(
            {
                formatters = {"autopep8"},
            })
        end,
        mode="n",
        desc="Python - Format with autopep8"
    },
    {
        "<leader>py",
        function()
            conform.format({
                formatters = {"yapf"},
            })
        end,
        mode="n",
        desc="Python - Format with yapf"
    },
    {
        "<leader>pb",
        function()
            conform.format({
                formatters = {"black"},
            })
        end,
        mode="n",
        desc="Python - Format with black"
    },
    -- LSP
    {
        "K",
        "<cmd>Lspsaga hover_doc<cr>",
        mode="n",
        desc="Hover Doc"
    },
    {
        "ga",
        "<cmd>Lspsaga code_action<cr>",
        mode="n",
        desc="Code Action"
    },
    {
        "<leader>f",
        "<cmd>Lspsaga finder<cr>",
        mode="n",
        desc="Open finder"
    },
    {
        "<C-`>",
        "<cmd>Lspsaga term_toggle<cr>",
        mode="n",
        desc="Float terminal"
    },
    {
        "]e",
        "<cmd>Lspsaga diagnostic_jump_next<cr>",
        mode="n",
        desc="Jump next diagnostic"
    },
    {
        "[e",
        "<cmd>Lspsaga diagnostic_jump_prev<cr>",
        mode="n",
        desc="Jump prev diagnostic"
    },
    {
        "<leader>gg",
        "<cmd>lua _lazygit_toggle()<cr>",
        mode="n",
        desc="Toggle lazygit"
    },

    -- Debugger
    {
        "<leader>dt",
        "<cmd>lua require('dapui').toggle()<cr>",
        mode="n",
        desc="Debugger - Toggle UI"
    },
    {
        "<leader>db",
        "<cmd>DapToggleBreakpoint<cr>",
        mode="n",
        desc="Debugger - Toggle Breakpoint"
    },
    {
        "<leader>dc",
        "<cmd>DapContinue<cr>",
        mode="n",
        desc="Debugger - Continue"
    },
    {
        "<leader>dr",
        "<cmd>lua require('dapui').open({ reset = true })<cr>",
        mode="n",
        desc="Debugger - Reset UI"
    },
    {
        "<leader>dnt",
        "<cmd>lua require('neotest').run.run({ strategy = 'dap' })",
        mode="n",
        desc="Debugger - Run Nearest Test"
    }
})
