--- SANTATRA SHORTCUT


-- <Leader>b to open file navigation (tags: netrw, navigation)
vim.keymap.set('n', '<Leader>b', "<cmd>25Lexplore<cr>")
-- Open file navigation in another tab
vim.keymap.set('n', '<Leader>B', '<cmd>Texplore<cr>')

-- Tagbar
vim.keymap.set('n', '<Leader>tt', "<cmd>TagbarToggle<cr>")

-- new line in normal mode
vim.keymap.set('n', '<Enter>', 'o<Esc>')

-- remap Enter to the original Enter when entering command line window
local clear_enter_group = vim.api.nvim_create_augroup('clear_enter_group', {
        clear = true
})
vim.api.nvim_create_autocmd('CmdwinEnter', {
    pattern = '*',
    group = clear_enter_group,
    command = 'nnoremap <buffer> <CR> <CR>'
})

-- remap Enter to the original Enter when entering quickfix
vim.api.nvim_create_autocmd('BufReadPost', {
    pattern = 'quickfix',
    command = 'nnoremap <buffer> <CR> <CR>'
})

-- Terminal mode F4
vim.keymap.set( {'n', 'i' }, '<F12>', "<cmd>split | :term<return>a")
vim.keymap.set( {'n', 'i' }, '<S-F12>', "<cmd>vsplit | :term<return>a")
vim.keymap.set( {'n', 'i' }, '<C-F12>', "<cmd>tabe | :term<return>a")
vim.keymap.set( {'t', 'i' }, '<Esc>', '<C-\\><C-n>')

-- open terminal mode with Ctrl-i too
vim.keymap.set( {'n'}, '<C-i>', 'i')


-- Clear highlight on pressing ESC
vim.keymap.set('n', '<esc>', ':noh<return><esc>', { silent = true  })

-- buffer
vim.keymap.set('n', '<Tab>', ':bn<CR>', { silent = false  } )
vim.keymap.set('n', '<S-Tab>', ':bp<CR>', { silent = false  } )

-- tab navigation
-- move tab to last and first
vim.keymap.set('n', '<Leader>t$', "<cmd>$tabmove<cr>", { silent = false })
vim.keymap.set('n', '<Leader>t0', "<cmd>0tabmove<cr>", { silent = false })


-- ========== SPLIT 
-- resize: make resize larger
vim.keymap.set('n', '<C-w>5+', '<C-w>+')
vim.keymap.set('n', '<C-w>5-', '<C-w>-')
vim.keymap.set('n', '<C-w>5<', '<C-w><')
vim.keymap.set('n', '<C-w>5>', '<C-w>>')

-- navigate split
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-h>', '<C-w>h')

-- -- asorina ny arrow satria ianao mbola debutant
-- vim.keymap.set({ 'n','i','v' }, '<up>', '')
-- vim.keymap.set({ 'n','i','v' }, '<down>', '')
-- vim.keymap.set({ 'n','i','v' }, '<right>', '')
-- vim.keymap.set({ 'n','i','v' }, '<left>', '')

-- Afaka movel line rehefa Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- garder cursor position rehefa join line
vim.keymap.set('n', 'J', "mzJ'z" )

-- garder position après les commandes
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '{', '{zz')
vim.keymap.set('n', '}', '}zz')
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<C-i>', '<C-i>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- centrer et augmenter C-e et C-y
vim.keymap.set('n', '<C-e>', '5<C-e>')
vim.keymap.set('n', '<C-y>', '5<C-y>')

-- zeal
vim.keymap.set('n', '<Leader>z', "<cmd>ZVKeyDocset<cr>")

-- replace all occurence of word under cursor
vim.keymap.set('n', '<Leader>s', ":%s/\\<<C-r><C-w>\\>//g<left><left>")

-- open current file in a new tab
vim.keymap.set('n', '<C-w>t', ":tabe %<cr>", { silent = true })

-- Copy to clipboard
vim.keymap.set('n', '<Leader>y', '"+y')
vim.keymap.set('v', '<Leader>y', '"+y')
vim.keymap.set('n', '<Leader>Y', '"+y$')

-- Insert mode
vim.keymap.set('i', '<A-a>', '<C-o>^')  -- go the begin of line
vim.keymap.set('i', '<A-e>', '<C-o>$')  -- go the end of line
vim.keymap.set('i', '<C-b>', '<C-o>h')
vim.keymap.set('i', '<C-f>', '<C-o>l')
vim.keymap.set('i', '<A-b>', '<C-o>b')
vim.keymap.set('i', '<A-f>', '<C-o>e')

-- search for selected text
vim.keymap.set('v', '<Leader>s', '"9y/<C-r>9<Enter>')

-- git remap (fugitive required)
vim.keymap.set('n', '<Leader>ga', ':G add ')
vim.keymap.set('n', '<Leader>gs', '<cmd>G status<CR>')
vim.keymap.set('n', '<Leader>gb', '<cmd>G branch<CR>')
vim.keymap.set('n', '<Leader>gcc', '<cmd>G commit<CR>')
vim.keymap.set('n', '<Leader>gca', '<cmd>G commit -a<CR>')
