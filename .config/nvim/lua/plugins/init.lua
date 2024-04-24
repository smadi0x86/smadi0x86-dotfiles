return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- Add your plugins here
   {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Language Servers
        "lua-language-server", -- Lua Language Server
        "gopls", -- Language Server for Go
        "rust-analyzer", -- Language Server for Rust
        "terraform-ls", -- Language Server for Terraform
        "dockerfile-language-server", -- Language Server for Dockerfile
        "docker-compose-language-service", -- Language Server for Docker Compose
        "yaml-language-server", -- Language Server for YAML
        "json-lsp", -- Language Server for JSON
        "bash-language-server", -- Language Server for Bash
        "pylyzer", -- Language Server for Python

        -- Linters
        "gitlint", -- Git Commit Linter
        "yamllint", -- YAML Linter
        "tflint", -- Terraform Linter
        "golangci-lint", -- Comprehensive Go Linter
        "ansible-lint", -- Ansible Configurations Linter
        "hadolint", -- Dockerfile Linter
        "pylint", -- Python Linter

        -- Debuggers
        "delve", -- Go Debugger
        "bash-debug-adapter", -- Bash Debugger

        -- Formatters
        "stylua", -- Lua Code Formatter
        "golines", -- Go Code Formatter
        "gomodifytags", -- Go Code Formatter
        "goimports", -- Go Imports management
        "goimports-reviser", -- Go Imports management
        "yamlfix", -- YAML Code Formatter
        "prettier", -- Code Formatter for various languages
        "autoflake", -- Python Code Formatter

        -- Addons
        "gitui", -- Git UI
        "gitleaks", -- Git Leaks Scanner
        "yq", -- YAML Processor
        "tfsec", -- Terraform Security Scanner
        "helm-ls", -- Helm Charts Linter

        -- Add other tools as needed
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "go", "c", "java", "python", "rust", "vimdoc", "yaml", "toml", "json", "dockerfile",
         "terraform"
      },
    },
  },
}