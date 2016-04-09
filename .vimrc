call plug#begin('~/.vim/plugged')
Plug 'pangloss/vim-javascript'

Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
" Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'msanders/snipmate.vim'
Plug 'vim-scripts/OmniCppComplete'
Plug 'junegunn/vim-easy-align'
call plug#end()

let mapleader = ","

let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '`':'`'}
let NERDSpaceDelims=1

let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

syntax on
colorscheme elflord
set encoding=utf-8
set autoread
set backspace=2       " backspace in insert mode works like normal editor
"set nobackup         " get rid of anoying ~file
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//

set ignorecase
set smartcase
set hlsearch
set incsearch
nnoremap <silent> <Space> :nohl<Bar>:echo<CR>

set ruler
set cursorline
set number
"set relativenumber

set textwidth=80

set autoindent
set smartindent
set cindent

set shiftwidth=8
set tabstop=8
set softtabstop=8
set expandtab
let g:html_indent_inctags = "html,body,head,tbody"
autocmd BufNewFile,BufFilePre,BufRead *.ejs set filetype=html
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd Filetype c setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd Filetype cpp setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType asm setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType perl setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType text setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd Filetype php setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype gitcommit setlocal ts=4 sts=4 sw=4
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype sh setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd FileType vim setlocal ts=2 sts=2 sw=2

"autocmd BufWrite * :%s/\s\+$//
noremap <leader><space> :%s/\s\+$//<CR>
set pastetoggle=<F10>

function! Expander()
  let line   = getline(".")
  let col    = col(".")
  let first  = line[col-2]
  let second = line[col-1]
  let third  = line[col]

  if first ==# ">"
    if second ==# "<" && third ==# "/"
      return "\<CR>\<C-o>O"
    else
      return "\<CR>"
    endif
  else
    return "\<CR>"
  endif
endfunction
inoremap <CR> <C-R>=Expander()<CR>
" set dictionary="/usr/dict/words"
set completeopt=longest,menuone

nmap <leader>c :find %:t:r.c <CR>
nmap <leader>h :find %:t:r.h <CR>
nnoremap <F9> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
