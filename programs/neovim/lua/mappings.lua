-- Autoformat
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = false })]]
local bufopts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>=b", function() vim.lsp.buf.format({ async = true }) end, bufopts)
