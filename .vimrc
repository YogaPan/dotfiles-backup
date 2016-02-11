set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-endwise'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/seoul256.vim'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = ","

let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

set laststatus=2
let g:airline_powerline_fonts = 1

let g:vim_markdown_folding_disabled = 1

let g:user_emmet_leader_key='<C-E>'
"let g:user_emmet_expandabbr_key = '<Tab>'
let g:user_emmet_install_global = 0
autocmd FileType html,css,eruby EmmetInstall

let g:ackprg = 'ag --vimgrep'

let g:AutoPairs = {'(':')', '[':']', '{':'}', '|':'|', "'":"'", '"':'"', '`':'`'}
let NERDSpaceDelims=1

let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterRevertHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk

" colorscheme seoul256
" let g:seoul256_background = 233
" colo seoul256
colorscheme hybrid_material
let g:airline_theme = "hybrid"

syntax on               " syntax highlighting
set encoding=utf-8
set autoread
set backspace=2         " backspace in insert mode works like normal editor
"set nobackup            " get rid of anoying ~file
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//

set ignorecase
set hlsearch
set incsearch
nnoremap <silent> <Space> :nohl<Bar>:echo<CR>

set ruler
set cursorline
set number
set relativenumber

set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
set smartindent
set cindent
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype sh setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

"autocmd BufWrite * :%s/\s\+$//
noremap <leader><space> :%s/\s\+$//<CR>

function! Expander()
  let line   = getline(".")
  let col    = col(".")
  let first  = line[col-2]
  let second = line[col-1]
  let third  = line[col]

  if first ==# ">"
    if second ==# "<" && third ==# "/"
      return "\<CR>\<C-o>==\<C-o>O"
    else
      return "\<CR>"
    endif
  else
    return "\<CR>"
  endif
endfunction

inoremap <expr> <CR> Expander()

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
"set dictionary="/usr/dict/words"
