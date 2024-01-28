-- Telescope
vim.cmd("nnoremap <silent> <C-p> :Telescope find_files<CR>")

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', function() builtin.find_files({
    no_ignore=true,
    hidden=true,
}) end,  {})
vim.keymap.set('n', '<leader>ff', builtin.git_files,  {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fm', builtin.marks, {})
vim.keymap.set('n', '<leader>fr', builtin.registers, {})
