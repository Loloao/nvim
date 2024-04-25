local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = {
    "angular",
    "bash",
    "c_sharp",
    "comment",
    "css",
    "c",
    "cpp",
    "scss",
    "diff",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "go",
    "html",
    "http",
    "java",
    "javascript",
    "jq",
    "jsdoc",
    "json",
    "json5",
    "jsonc",
    "lua",
    "markdown",
    "markdown_inline",
    "php",
    "php_only",
    "phpdoc",
    "query",
    "ruby",
    "rust",
    "sql",
    "ssh_config",
    "styled",
    "swift",
    "typescript",
    "tsx",
    "vim",
    "vimdoc",
    "vue",
    "xml",
    "yaml",
  },
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
