filetype plugin indent on
syntax on

set number
set nowrap
set showcmd
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set ruler
set relativenumber
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set noswapfile
set undofile
set undodir=~/.vim/undodir

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'jremmen/vim-ripgrep'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1
let g:netrw_altv = 1 
colorscheme candycode

"" Ripgrep uses git root if there
if executable('rg')
    let g:rg_derive_root='true'
endif

hi Pmenu ctermfg=White ctermbg=235
hi PmenuSel ctermfg=Black ctermbg=White
hi ColorColumn ctermbg=235
"" Checks silently for local vim config
silent! so .vimlocal

"" Set tab keys to match bracket pairs
nnoremap <tab> %
vnoremap <tab> %

let mapleader = "\<Space>"

"" Sane text wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80

"" ,ev to open and edit vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e ~/.config/nvim/init.vim<cr>

" window navigation
nnoremap <leader><Tab>[ :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader><Tab>] :wincmd l<CR>
nnoremap <leader>= :wincmd =<CR>
"" Save 
nnoremap <leader>s :w<CR>

"" Mimic forward and backward normal operation
nnoremap <leader>[ <C-o>
nnoremap <leader>] <C-i>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>1 :NERDTreeToggle<CR> 
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>ef :CocFix<CR>

"" Space Tab to write and save
nnoremap <leader><Tab> :w!<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader>u :UndotreeShow<CR>

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader><Tab>l :CocCommand prettier.formatFile<CR>
nnoremap <leader>cr :CocRestart
nnoremap <leader>cf :CocFix<CR>
nnoremap <leader>di :CocList diagnostics<CR>

nnoremap <leader>nh :noh<CR>
" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul
:autocmd CursorHold * call CocActionAsync('doHover')

command! -nargs=0 Prettier :CocCommand prettier.formatFile

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

"" Make Coc use tab select
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:ut = 2000
