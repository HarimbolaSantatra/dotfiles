" pathogen plugin manager
execute pathogen#infect()

set number relativenumber
set ignorecase
" wildmenu: suggestion on cmd line mode after <tab>
set wildmenu
" increamental search and highlight all found search
set incsearch
set hlsearch

" Toujours afficher le status line
set laststatus=2

syntax on
filetype plugin indent on

" " Explorer
nnoremap <Leader>b :NERDTreeToggle<CR>

" vim-fzf rehefa cltr+p
nnoremap <silent> <C-p> :Files<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" buffer
nnoremap <BS> :bn<CR>
nnoremap <Leader>l :ls<CR>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" open current file in a new tab
nnoremap <C-w>t <C-W><C-V> <C-W>T

" recording
nnoremap Q q

" remove highligh
nnoremap <Esc><Esc> :noh<CR>

" disable comment and new line in normal mode
map <Enter> o<ESC>cc<Esc>
map o o<Esc>cc
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" remap Enter to the original Enter when entering command line window
" source: https://stackoverflow.com/questions/24599217/remap-enter-in-normal-mode-but-not-in-command-line
augroup commandlinewindow
    autocmd!
    autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
augroup END

" remap Enter to the original Enter when entering quickfix
" https://superuser.com/questions/815416/hitting-enter-in-the-quickfix-window-doesnt-work
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>


" Theme/Color scheme
set background=dark
colorscheme PaperColor


" atao current dir/path misy ilay file ny dir vim
" :set autochdir

" INDENTATION
:set tabstop=4      " tab character
:set shiftwidth=4 smarttab  " level of indentation, insert indentation, not tabs char
:set expandtab    " use only space characters, not tabs
autocmd FileType c setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab

" html auto close tag, tap C-x C-o to auto complete after < tag
autocmd FileType html, javascript set omnifunc=htmlcomplete#CompleteTags

" split
:set splitright
:set splitbelow

" Center screen on next/previous selection.
nnoremap n nzz
nnoremap N Nzz

" add cursorline
:set cursorline

" SCROLL VERTICAL CENTERING
" there are always at least <n> lines visible above the cursor, and five lines visible below the cursor
" ataovy ambony be raha tinal ho ampovoany foana ny curseur
:set scrolloff=7
" alternative an'io de afaka atao ohatran'izao
" :nnoremap j jzz
" :nnoremap k kzz

" scroll size to a third of the window
:execute "set scroll=" .&lines / 3
" auto command for when window is resized
:au VimResized * execute "set scroll=" .&lines / 3

" ============ VIM_PLUG ============
call plug#begin('~/.vim/bundle')

" fzf.vim
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" zeal doc
Plug 'KabbAmine/zeavim.vim'

" nerd tree
Plug 'preservim/nerdtree'

call plug#end()

" =========== END VIM PLUG ========"


" Enhanced increment/decrement which will go to next number even if it's not in the same line
" from https://vim.fandom.com/wiki/Increasing_or_decreasing_numbers
function! AddSubtract(char, back)
  let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
  call search(pattern, 'cw' . a:back)
  execute 'normal! ' . v:count1 . a:char
  silent! call repeat#set(":\<C-u>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
endfunction
nnoremap <silent>         <C-a> :<C-u>call AddSubtract("\<C-a>", '')<CR>
nnoremap <silent> <Leader><C-a> :<C-u>call AddSubtract("\<C-a>", 'b')<CR>
nnoremap <silent>         <C-x> :<C-u>call AddSubtract("\<C-x>", '')<CR>
nnoremap <silent> <Leader><C-x> :<C-u>call AddSubtract("\<C-x>", 'b')<CR>

" Terminal F12
nnoremap <F12> :term<return>
nnoremap <S-F12> :term<return>

" exit terminal mode
tnoremap <Esc> <C-W>N

" ========== My Command
" Open current file sublime text
:command Subl !subl %
" launch python
:command Py !python3 %:t
" new tab with explorer
:command Tab :Texplore

" ========== My macros
let @x = '^aX<Esc>'

" ========== SPLIT 
" resize
nnoremap <C-up> <C-w>+
nnoremap <C-down> <C-w>-
nnoremap <C-left> <C-w><
nnoremap <C-right> <C-w>>

" navigate split
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Zeal interactive search
:command Zeal <Plug>ZVKeyDocset
nmap <Leader>z <Plug>ZVKeyDocset

" AUTOMATICALLY :copen AFTER :vimgrep
" create a self-clearing autocommand group called 'qf'
augroup qf
    " clear all autocommands in this group
    autocmd!

    " do :cwindow if the quickfix command doesn't start
    " with a 'l' (:grep, :make, etc.)
    autocmd QuickFixCmdPost [^l]* cwindow

    " do :lwindow if the quickfix command starts with
    " a 'l' (:lgrep, :lmake, etc.)
    autocmd QuickFixCmdPost l*    lwindow

    " do :cwindow when Vim was started with the '-q' flag
    autocmd VimEnter        *     cwindow
augroup END


" Write
:command W :w

" Insert mode
" go to begin of line
inoremap <C-b> <C-o>h
inoremap <C-f> <C-o>l

" search for selected text
vnoremap <Leader>s "9y/<C-r>9<Enter>

" fugitive remap
nnoremap <Leader>Ga :G add
nnoremap <Leader>gs :G status<return>
nnoremap <Leader>gb :G branch<return>
nnoremap <Leader>gcc :G commit<return>
nnoremap <Leader>gca :G commit -a<return>
