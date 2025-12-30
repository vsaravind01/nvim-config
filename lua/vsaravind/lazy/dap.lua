return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function ()
            local dapui = require("dapui")
            dapui.setup()
        end
    },
    {
        "mfussenegger/nvim-dap-python",
        config = function ()
            local dap_python = require("dap-python")
            local dap = require("dap")
            dap_python.setup("python")
            table.insert(dap.configurations.python, {
                justMyCode = false,
                type = 'python',
                request = 'launch',
                name = 'Debug with Library Access',
                program = '${file}',
                args = function()
                    local args_string = vim.fn.input('Arguments: ')
                    local utils = require("dap.utils")
                    if utils.splitstr and vim.fn.has("nvim-0.10") == 1 then
                        return utils.splitstr(args_string)
                    end
                    return vim.split(args_string, " +")
                end;
                console = 'integratedTerminal';
                -- sourceMaps = true,  -- Required for package debugging 
                -- showReturnValue = true,
                -- debugOptions = {
                --     'RedirectOutput',
                --     'ShowReturnValue',
                --     'DebugStdLib'  -- Explicitly enable stdlib debugging 
                -- }
            })
        end
    }
}
