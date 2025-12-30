return {
    "polarmutex/git-worktree.nvim",
    config = function()
        local hooks = require("git-worktree.hooks")
        local config = require("git-worktree.config")
        local update_on_switch = hooks.builtins.update_current_buffer_on_switch
        hooks.register(hooks.type.SWITCH, function (path, prev_path)
            vim.notify("Moved from " .. prev_path .. " to " .. path)
            update_on_switch(path, prev_path)
        end)

        hooks.register(hooks.type.DELETE, function ()
            vim.cmd(config.update_on_change_command)
        end)

        hooks.register(hooks.type.SWITCH, hooks.builtins.update_current_buffer_on_switch)

        require('telescope').load_extension('git_worktree')
    end
}
