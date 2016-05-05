" Plugins {{{
call plug#begin('~/.vim/plugged')
" front-end develop
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'

" git setting
Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'

" colorscheme
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Switch file and buffer
Plug 'kien/ctrlp.vim'

" edit
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-endwise'
Plug 'hynek/vim-python-pep8-indent'
Plug 'rking/ag.vim'
"Plug 'Valloric/YouCompleteMe'
"Plug 'msanders/snipmate.vim'
"Plug 'mattn/emmet-vim'
"Plug 'vim-scripts/OmniCppComplete'
call plug#end()
" }}}

" Key map settings {{{
let mapleader = ","

" open and source vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" delete trailing space
noremap <leader><space> :%s/\s\+$//<CR>:nohl<Bar>:echo<CR>

" emacs loke key binding when use insert mode
noremap <C-l> zz
inoremap <C-l> <C-o>zz
inoremap <C-a> <C-o>I
inoremap <C-e> <C-o>A
set pastetoggle=<F10>

" Just use hjkl
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
"inoremap jk <esc>
"inoremap <esc> <nop>

onoremap p i(
nmap <leader>c :find %:t:r.c <CR>
nmap <leader>h :find %:t:r.h <CR>
nnoremap <F8> :!ctags -R<CR><CR>
nnoremap <silent> <Space> :nohl<Bar>:echo<CR>
" nnoremap <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
" }}}

" Plugin settings {{{

" YouCompleteMe settings
"let g:ycm_python_binary_path = '/usr/local/bin/python3'
"let g:ycm_confirm_extra_conf = 0

" Emmet settings
"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall
"let g:user_emmet_leader_key='<C-E>'

" Airline Settings
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
set laststatus=2

" Javascript Settings
let g:javascript_ignore_javaScriptdoc = 1
let g:jsx_ext_required = 0
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js"

" Autopair settings
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '`':'`'}
let NERDSpaceDelims=1

" Multu cursor settings
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Incsearch Settings
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1

" EasyAlign settings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Tagbar settings
nmap <F9> :TagbarToggle<CR>
let g:tagbar_width = 30
let g:tagbar_left = 0

" }}}

" Basic settings {{{
syntax on
set background=dark
colo solarized

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

set ruler
set cursorline
" hi CursorLine term=bold cterm=bold guibg=Grey40
" set number
" set relativenumber

set textwidth=80

" set dictionary="/usr/dict/words"
set completeopt=longest,menuone
" }}}

" Indent setting {{{
set autoindent
set smartindent
set cindent

set shiftwidth=8
set tabstop=8
set softtabstop=8
set expandtab
let g:html_indent_inctags = "html,body,head,tbody"

augroup vim_indent
  autocmd!
  autocmd BufNewFile,BufFilePre,BufRead *.ejs set filetype=html
  autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufFilePre,BufRead .bowerrc set filetype=json
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
  autocmd Filetype json setlocal ts=2 sts=2 sw=2
  autocmd FileType vim setlocal ts=2 sts=2 sw=2 noexpandtab foldmethod=marker
  "autocmd BufWrite * :%s/\s\+$//
augroup END
" }}}

" Function {{{
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
" }}}
