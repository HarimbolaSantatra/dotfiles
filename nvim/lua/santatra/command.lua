-- resource config file
vim.api.nvim_create_user_command('Reso', "source ~/.config/nvim/init.lua", {})
-- lauch sublime text
vim.api.nvim_create_user_command('Subl', "!subl %", {})
-- launch python on the file
vim.api.nvim_create_user_command('Py', "!python3 %", {})
-- Terminal mode in new tab
vim.api.nvim_create_user_command('Term', ":tabe | :term", {})
-- create vim session file
vim.api.nvim_create_user_command('Mks', "mks! Session.vim", {})
-- Delete a buffer without closing a window
vim.api.nvim_create_user_command('BD', ":b#|bd#", {})
-- save with W
vim.api.nvim_create_user_command('W', "w", {})

-- Open with typora
vim.api.nvim_create_user_command('Typora', "!typora % &", {})

-- Copy current directoy
vim.api.nvim_create_user_command('Ydxsel', "!ydxsel", {})
-- Set number
vim.api.nvim_create_user_command('Num', "set number | set relativenumber", {})

-- Lazy Git push
vim.api.nvim_create_user_command('LG', "!git add . && git commit -m \'Lazypush\' && git push", {})
