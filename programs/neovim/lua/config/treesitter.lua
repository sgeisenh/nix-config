require("nvim-treesitter.install").compilers = { "clang++" }

require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
