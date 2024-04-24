-- Load essential lspconfig settings from nvchad
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- List of language servers
local servers = {
    "lua_ls",       -- Lua Language Server
    "gopls",        -- Language Server for Go
    "rust_analyzer",-- Language Server for Rust
    "terraformls",  -- Language Server for Terraform
    "dockerls",     -- Language Server for Dockerfile
    "yamlls",       -- Language Server for YAML
    "jsonls",       -- Language Server for JSON
    "bashls",       -- Language Server for Bash
    "pyright",      -- Language Server for Python
}

-- Applying default configuration to all language servers in the list
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities
    }
end

-- Specific configurations for language servers that need additional settings

-- Lua Language Server specific configuration
lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',  -- Set Lua version to LuaJIT
            },
            diagnostics = {
                globals = {'vim'},  -- Recognize the 'vim' global
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,  -- Disable telemetry to prevent sending data
            },
        },
    },
}

-- Go Language Server specific configuration
lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,  -- Enable unused parameter analysis
            },
            staticcheck = true,  -- Enable staticcheck linter
        },
    },
}

-- Python Language Server specific configuration
lspconfig.pyright.setup {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "strict",  -- Enable strict type checking
            }
        }
    }
}

-- This setup ensures basic functionality across multiple languages with scope for fine-grained configuration.
-- For more advanced configurations, refer to the respective language server documentation.
