-- LSP on_attach
local on_attach = function(_, _)
    require("which-key").add({
        { "<leader>rn", vim.lsp.buf.rename, desc = "LSP Rename" },
        { "<leader>ca", vim.lsp.buf.code_action, desc = "LSP Code Action" },

        { "gd", vim.lsp.buf.definition, desc = "LSP Definition" },
        { "gD", vim.lsp.buf.declaration, desc = "LSP Declaration" },
        { "gi", vim.lsp.buf.implementation, desc = "LSP Implementation" },
        {
            "gr",
            require("telescope.builtin").lsp_references,
            desc = "LSP References (Telescope)",
        },
    }, { mode = "n" })
end

-- Plugin spec
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup()
            end,
        },
        {
            "williamboman/mason-lspconfig.nvim",
            dependencies = { "williamboman/mason.nvim" },
            config = function()
                require("mason-lspconfig").setup({
                    ensure_installed = {
                        "lua_ls",
                        "pyright",
                        "pylsp",
                        "jsonls",
                        "gopls",
                        "bashls",
                        "yamlls",
                        "marksman",
                        "html",
                    },
                })
            end,
        },
        {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            dependencies = { "williamboman/mason.nvim" },
            config = function()
                require("mason-tool-installer").setup({
                    ensure_installed = {
                        "stylua",
                        "black",
                        "isort",
                        "autopep8",
                        "yapf",
                        "flake8",
                        "pylint",
                        "mypy",
                        "debugpy",
                    },
                })
            end,
        },
        {
            "stevearc/conform.nvim",
            opts = {},
        },
    },

    config = function()
        -- Formatting
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black", "autopep8", "yapf" },
                go = { "goimports", "gofmt" },
            },
        })

        -- Capabilities
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        -- LSP servers (Neovim 0.11 API)

        vim.lsp.config("pyright", {
            capabilities = capabilities,
            on_attach = on_attach,
        })

        vim.lsp.config("pylsp", {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                pylsp = {
                    configurationSources = { "flake8" },
                    plugins = {
                        flake8 = {
                            enabled = true,
                            config = "setup.cfg",
                        },
                        pycodestyle = { enabled = false },
                    },
                },
            },
        })

        vim.lsp.config("jsonls", {
            capabilities = capabilities,
            on_attach = on_attach,
        })

        vim.lsp.config("gopls", {
            capabilities = capabilities,
            on_attach = on_attach,
        })

        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            on_attach = on_attach,
            on_init = function(client)
                local path = client.workspace_folders[1].name
                if vim.uv.fs_stat(path .. "/.luarc.json")
                    or vim.uv.fs_stat(path .. "/.luarc.jsonc")
                then
                    return
                end

                client.config.settings.Lua = vim.tbl_deep_extend(
                    "force",
                    client.config.settings.Lua,
                    {
                        runtime = { version = "LuaJIT" },
                        workspace = {
                            checkThirdParty = false,
                            library = { vim.env.VIMRUNTIME },
                        },
                    }
                )
            end,
            settings = { Lua = {} },
        })
    end,
}
