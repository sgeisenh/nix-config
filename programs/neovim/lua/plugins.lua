local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local function get_config(name)
  return string.format('require("config/%s")', name)
end

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  })
  print("Installing packer...")
  vim.api.nvim_command("packadd packer.nvim")
end

local packer = require("packer")

packer.init({
  enable = true,
  threshold = 0,
  max_jobs = 20,
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

packer.startup(function(use)
  use("wbthomason/packer.nvim")

  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
  })

  use({ "neovim/nvim-lspconfig", config = get_config("lsp") })

  use({
    "simrat39/rust-tools.nvim",
    config = get_config("rust-tools"),
  })

  use("ellisonleao/gruvbox.nvim")

  use({ "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
    },
    config = get_config("cmp"),
  })

  use("L3MON4D3/LuaSnip")

  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics
      null_ls.setup({
        filetypes = { "javascript" },
        sources = {
          formatting.prettier,
          formatting.black,
          diagnostics.flake8
        },
      })
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })
end)
