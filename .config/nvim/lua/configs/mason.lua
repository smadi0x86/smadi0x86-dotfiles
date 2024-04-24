local options = {
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

  PATH = "skip",

  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    },

    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },

  max_concurrent_installers = 10,
}

return options