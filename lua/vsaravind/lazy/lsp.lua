local on_attach = function(_, _)
    require("which-key").add({
        {
            "<leader>rn",
            vim.lsp.buf.rename,
            mode="n",
            desc="LSP Rename"
        },
        {
            "<leader>ca",
            vim.lsp.buf.code_action,
            mode="n",
            desc="LSP Code Action"
        },
        {
            "gd",
            vim.lsp.buf.declaration,
            mode="n",
            desc="LSP Definition"
        },
        {
            "gD",
            vim.lsp.buf.definitions,
            mode="n",
            desc="LSP Declaration"
        },
        {
            "gi",
            vim.lsp.buf.implementation,
            mode="n",
            desc="LSP Implementation"
        },
        {
            "gr",
            require("telescope.builtin").lsp_references,
            mode="n",
            desc="LSP References (Telescope)"
        },
    })
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            config = function()
                require('mason-tool-installer').setup {
                    ensure_installed = {
                        "stylua",
                        "black",
                        "debugpy",
                        "yapf",
                        "autopep8",
                        "pylint",
                        "mypy",
                        "flake8",
                        "isort",
                    }
                }
            end,
            dependencies = {
                "williamboman/mason-lspconfig.nvim",
                dependencies = {
                    "williamboman/mason.nvim",
                    config = function()
                        require("mason").setup()
                    end

                },
                config = function()
                    require("mason-lspconfig").setup({
                        ensure_installed = {
                            'lua_ls',
                            'html',
                            'bashls',
                            'jsonls',
                            'marksman',
                            'yamlls',
                            'pyright'
                        }
                    })
                end
            },
        },
        {
            "stevearc/conform.nvim",
            opts = {}
        }
    },
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "yapf", "flake8", "isort", "black", "autopep8" }
            }
        })

        local lspconfig = require("lspconfig")

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        lspconfig.pyright.setup({
            capabilities = capabilities,
            on_attach = on_attach
        })
        lspconfig.lua_ls.setup ({
            on_init = function(client)
                local path = client.workspace_folders[1].name
                if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
                    return
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        version = 'LuaJIT'
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                        }
                    }
                })
            end,
            on_attach = on_attach,
            settings = {
                Lua = {}
            }
        })
    end
}

