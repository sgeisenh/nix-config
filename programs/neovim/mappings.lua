-- Autoformat
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = false })]]
local bufopts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>=b", function() vim.lsp.buf.format({ async = true }) end, bufopts)

pcall(require("telescope").load_extension, "fzf")

vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]each [F]iles" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
