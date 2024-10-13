return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim", opts = {} },
    },

    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }
 
                -- keybinds 
                opts.desc = "Show LSP References"
                vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
                opts.desc = "Go To Declaration"
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                opts.desc = "Show LSP Definitions"
                vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
                opts.desc = "Show LSP Implmentation"
                vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
                opts.desc = "Show LSP Type Definitions"
                vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
                opts.desc = "See Available Code Actions"
                vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)
                opts.desc = "Smart Rename"
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                

                opts.desc = "Show Buffer Diagnostics"
                vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
                opts.desc = "Show Line Diagnostic"
                vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float,opts)
                opts.desc = "Previous Diagnostic"
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                opts.desc = "Next Diagnostic"
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next,opts)

                opts.desc = "Show Doc of Under Cursor"
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                opts.desc = "Restart LSP"
                vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

                -- change the diagnostic symbols in the sign column
                local signs = { Error = "⦻ ", Warn = "⚠ ", Hint = "⚙️ ", Info = "ⓘ "}
                for type, icon in pairs(signs) do
                    local hl = "DiagnosticSign" .. type
                    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
                end

                require("lspconfig").clangd.setup({
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                    -- You can add any other options specific to clangd here
                    cmd = { "clangd", "--background-index" },  -- Example command to start clangd
                    filetypes = { "cpp", "c", "objc", "objcpp" },
                    settings = {
                        clangd = {
                            diagnostics = {
                                missingInclude = true,
                                missingIncludePath = true,
                            }
                        },
                    },
                })
                -- ensure diagnostics enabled globally
                vim.diagnostic.config({
                    signs = {
                        { name = "DiagnosticSignError", text = "" },
                        { name = "DiagnosticSignWarn",  text = "" },
                        { name = "DiagnosticSignInfo",  text = "" },
                        { name = "DiagnosticSignHint",  text = "" },
                    },
                    virtual_text = false,
                    update_in_insert = false,
                    underline = true,
                    severity_sort = true,
                    float = {
                        border = "rounded",
                        source = "always",
                        header = "",
                        prefix = "",
                    },
                })

                -- Enable diagnostics for clangd specifically
                vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                    vim.lsp.diagnostic.on_publish_diagnostics, {
                        underline = true,
                        update_in_insert = false,
                    }
                )
            end,
        })
    end,
}
