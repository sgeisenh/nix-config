-- Autoformat
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
local bufopts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>=b", function() vim.lsp.buf.formatting { async = true } end, bufopts)
