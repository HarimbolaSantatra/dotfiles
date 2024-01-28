vim.keymap.set("n", "<Leader>ha", function() require("harpoon.ui").add_file() end)
vim.keymap.set("n", "<Leader>hd", function() require("harpoon.ui").remove_file() end)
vim.keymap.set("n", "<Leader>hh", function() require("harpoon.ui").toggle_quick_menu() end)
vim.keymap.set("n", "<Leader>hn", function() require("harpoon.ui").nav_next() end)
vim.keymap.set("n", "<Leader>hp", function() require("harpoon.ui").nav_prev() end)

