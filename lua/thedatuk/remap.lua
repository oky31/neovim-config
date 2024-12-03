vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>tn", ":tabnext<cr>")
vim.keymap.set("n", "<leader>tp", ":tabprevious<cr>")

vim.keymap.set('n', '<C-t>', function()
    local current_file = vim.fn.expand('%:p')
    vim.cmd('tabnew ' .. current_file)
end, { noremap = true, silent = true })

