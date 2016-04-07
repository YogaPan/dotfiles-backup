call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'haya14busa/incsearch.vim'
Plug 'mattn/emmet-vim'
Plug 'Shougo/deoplete.nvim'
" Plug 'msanders/snipmate.vim'
Plug 'tpope/vim-endwise'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/seoul256.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'kristijanhusak/vim-hybrid-material'
call plug#end()

let mapleader = ","

let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#checks = ['indent', 'trailing']
" let g:airline#extensions#whitespace#checks = ['indent', 'trailing', 'long', 'mixed-indent-file']
let g:airline#extensions#whitespace#mixed_indent_algo = 1

let g:user_emmet_leader_key='<C-E>'
"let g:user_emmet_expandabbr_key = '<Tab>'
let g:user_emmet_install_global = 0
autocmd FileType html,css,eruby EmmetInstall

let g:ackprg = 'ag --vimgrep'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <F5> :NERDTreeToggle<CR>

let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '`':'`'}
let NERDSpaceDelims=1

let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterRevertHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk

let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

let g:deoplete#enable_at_startup = 1

" colorscheme solarized
" set background=dark
colorscheme seoul256
let g:seoul256_background = 233
colo seoul256
" colorscheme hybrid_material
" colorscheme hybrid_reverse
" let g:airline_theme = "hybrid"

syntax on
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

" function! Tab_Or_Complete()
  " if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    " return "\<C-N>"
  " else
    " return "\<Tab>"
  " endif
" endfunction
" inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
" set dictionary="/usr/dict/words"
set completeopt=menu

nmap <leader> c :find %:t:r.c <CR>
nmap <leader> h :find %:t:r.h <CR>
