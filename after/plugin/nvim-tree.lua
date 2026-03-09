local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    return
end

nvim_tree.setup({
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = false,
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {},
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    filters = {
        dotfiles = false,
        custom = { ".git", "node_modules", ".cache" },
        exclude = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 30,
        side = "left",
        number = false,
        relativenumber = false,
        signcolumn = "yes",
    },
    actions = {
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "flutterToolsOutline" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },
})

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
