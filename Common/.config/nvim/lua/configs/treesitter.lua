local options = {
  ensure_installed = {
        "vim", "lua", "go", "c", "java", "python", "rust", "vimdoc", "yaml", "toml", "json", "dockerfile",
         "terraform", "c", "cpp", "hcl"
      },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return options
