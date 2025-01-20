local function change_nvim_tree_dir()
	local nvim_tree = require("nvim-tree")
	nvim_tree.change_dir(vim.fn.getcwd())
end

return {
    'rmagatti/auto-session',
    lazy = false,
    keys = {
        -- Will use Telescope if installed or a vim.ui.select picker otherwise
        { '<leader>wr', '<cmd>SessionSearch<CR>', desc = 'Session search' },
        { '<leader>ws', '<cmd>SessionSave<CR>', desc = 'Save session' },
        { '<leader>wa', '<cmd>SessionToggleAutoSave<CR>', desc = 'Toggle autosave' },
    },

    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
        suppressed_dirs = { '~/', '~/Downloads', '/' },
    },

    config = function()
        local auto_session = require("auto-session")
        auto_session.setup({
            log_level = "error",
            post_restore_cmds = { change_nvim_tree_dir, "NvimTreeOpen" },
            pre_save_cmds = { "NvimTreeClose" },
            post_save_cmds = { "NvimTreeOpen" }
        })
    end
}
