" How to use this .vimrc file?
"
" If you are using vim and macvim, just copy this .vimrc file
" into your home directory.
" If you are using neovim, copy this .vimrc file into
" ~/.config/nvim/init.vim
"
"
"
" Install vim-plug
" Go to this site and see how to get vim-plug.
" https://github.com/junegunn/vim-plug
"
" if you are using vim and macvim:
" $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" if you are using neovim:
" $ curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"
"
" Install all package via vim-plug:
" $ vim +PlugInstall +qall
"
"
"
" Compile YouCompleteMe and install third party
" Go to this site and see how to compile ycm and install third party.
" https://github.com/Valloric/YouCompleteMe
"
" $ cd ~/.vim/bundle/YouCompleteMe
" $ ./install.py --clang-completer --gocode-completer --tern-completer
"
"
"
" Install go-vim
" After set your $GOPATH
" $ vim +GoInstallBinaries
"
" Go to this site and see more about go-vim.
" https://github.com/fatih/vim-go


" Installed Plugins {{{
call plug#begin('~/.config/nvim/plugged')

" Front-end develop
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ap/vim-css-color'
Plug 'othree/html5.vim'

" Golang package
Plug 'fatih/vim-go'

" Markdown syntax support
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Git setting
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Colorscheme
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'nanotech/jellybeans.vim'
" Plug 'junegunn/seoul256.vim'

" Switch file and buffer
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
" Plug 'rking/ag.vim'
" Plug 'tacahiroy/ctrlp-funky'
" Plug 'Valloric/ListToggle'

" Syntax checker
" Plug 'scrooloose/syntastic'

" Edit and autocomplete
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-endwise'
Plug 'hynek/vim-python-pep8-indent'
Plug 'mattn/emmet-vim'
Plug 'Valloric/YouCompleteMe'
" Plug 'ervandew/supertab'
" Plug 'Shougo/deoplete.nvim'
" Plug 'msanders/snipmate.vim'
" Plug 'alvan/vim-closetag'
"
call plug#end()
" }}}

" Key map settings {{{
let mapleader = ","


" Open and source vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


" Delete trailing space
noremap <leader><space> :%s/\s\+$//<CR>:nohl<Bar>:echo<CR>
" Disabled highlight
nnoremap <silent> <Space> :nohl<Bar>:echo<CR>


" Emacs like key binding when use insert mode
noremap <C-l> zz
inoremap <C-l> <C-o>zz
inoremap <C-f> <C-o>l
inoremap <C-b> <C-o>h
inoremap <A-b> <C-o>b
inoremap <A-w> <C-o>w
inoremap <C-a> <C-o>I
inoremap <C-e> <C-o>A


set pastetoggle=<F10>
" nnoremap ; :execute "normal! mqA;\e`q"<CR>


" Just use hjkl
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>


" Force to not use esc key.
" inoremap jk <esc>
" inoremap <esc> <nop>


onoremap p i(
nnoremap <leader>c :find %:t:r.c <CR>
nnoremap <leader>h :find %:t:r.h <CR>
nnoremap <F8> :!ctags -R<CR><CR>
" nnoremap <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
" }}}

" Plugin settings {{{

" YouCompleteMe settings
let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>>'
let g:ycm_complete_in_comments = 0
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 0
set tags+=./tags
highlight YcmErrorLine guibg=#3f0000
nnoremap <leader>jd :YcmCompleter GoTo<CR>


" SuperTab settings
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"


" Use deoplete.
let g:deoplete#enable_at_startup = 1


" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint'
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }


" fugitive git bindings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -q<CR>
nnoremap <space>gt :Gcommit -q %:p<CR>
" use -v parameter when Gcommit, optional.
" nnoremap <space>gc :Gcommit -v -q<CR>
" nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>


" Emmet settings
autocmd FileType html,css,javascript EmmetInstall
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-E>'


" Airline Settings
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
" All options: indent, trailing, long, mixed-indent-file
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing']
set laststatus=1


" Javascript Settings
let g:javascript_ignore_javaScriptdoc = 1
let g:jsx_ext_required = 0
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.ejs,*.js"


" Autopair settings
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '`':'`'}
let NERDSpaceDelims = 1


" Ctrl-P settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_show_hidden = 1
" let g:ctrlp_user_command = 'find %s -type f'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*/.git/*,*/node_modules/*


" Ctrlp Funky settings
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1


" NerdTree settings
map <Space>q :NERDTreeToggle<CR>
"let NERDTreeWinPos="right"
let g:NERDTreeWinSize = 20
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1


" Multi cursor settings
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'


" Incsearch Settings
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1


" EasyAlign settings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" markdown settings
let g:vim_markdown_folding_disabled = 1


" Tagbar settings
nnoremap <space>w :TagbarToggle<CR>
let g:tagbar_width = 20
let g:tagbar_left = 0


" Golang settings
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" au FileType go nmap <Leader>gd <Plug>(go-doc)
" au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
" let g:go_fmt_fail_silently = 1
" let g:go_fmt_autosave = 0
" let g:go_play_open_browser = 0
" let g:go_bin_path = expand("~/.gotools")
" let g:go_bin_path = "/home/fatih/.mypath"
" let g:go_get_update = 0

au FileType go nmap <leader>rt <Plug>(go-run-tab)
au FileType go nmap <Leader>rs <Plug>(go-run-split)
au FileType go nmap <Leader>rv <Plug>(go-run-vertical)

" let g:go_term_mode = "split"
" let g:go_term_enabled = 1
" let g:go_list_type = "quickfix"


" }}}

" Basic settings {{{

" Colorscheme and syntax
syntax on
set background=dark

let g:seoul256_background = 233
" let g:solarized_termtrans = 1
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" let g:solarized_termcolors = 16

" colo seoul256
" colo jellybeans
colo solarized
" colo elflord  " This one a little better than default colorscheme.


" Auto load .vimrc
" Default is disable. because this may cause some fatal problems.
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

" Editor behavior
set encoding=utf-8
set backspace=2  " backspace in insert mode works like normal editor
set autoread


" Backup settings
" set nobackup  " get rid of anoying ~file
set backupdir=~/.config/nvim/backup_files//
set directory=~/.config/nvim/swap_files//
set undodir=~/.config/nvim/undo_files//


" Search settings
set ignorecase
set smartcase
set hlsearch
set incsearch


" Cursor and Ruler
set ruler
set cursorline
set number
" set relativenumber
hi CursorLine term=bold cterm=bold guibg=Grey40


" Auto newline
set wrap
set textwidth=80


" Use system clipboard
set clipboard+=unnamedplus


" Auto complete
" set dictionary="/usr/dict/words"
set completeopt=longest,menuone

" }}}

" Indent setting {{{
set autoindent
set smartindent
set cindent
"let g:html_indent_inctags = "html,body,head,tbody"


" Default indent
" set shiftwidth=8
" set tabstop=8
" set softtabstop=8
" set expandtab


" Automatically delete traling space.
" autocmd BufWrite * :%s/\s\+$//


" Detect filetype
augroup vim_filetype
	autocmd!
	autocmd BufNewFile,BufFilePre,BufRead *.ejs set filetype=html
	autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
	autocmd BufNewFile,BufFilePre,BufRead *.fish set filetype=sh
	autocmd BufNewFile,BufFilePre,BufRead .bowerrc set filetype=json
	autocmd BufNewFile,BufFilePre,BufRead .tern-project set filetype=json
	autocmd BufNewFile,BufFilePre,BufRead .eslintrc set filetype=json
	autocmd BufNewFile,BufFilePre,BufRead *.h set filetype=c
augroup END


" Indent settings
augroup vim_indent
	autocmd!
	autocmd Filetype c setlocal ts=4 sts=4 sw=4 noexpandtab
	autocmd Filetype cpp setlocal ts=2 sts=2 sw=2 noexpandtab
	autocmd Filetype go setlocal ts=4 sts=4 sw=4 noexpandtab
	autocmd FileType asm setlocal ts=8 sts=8 sw=8 noexpandtab
	autocmd FileType perl setlocal ts=8 sts=8 sw=8 noexpandtab
	autocmd FileType text setlocal ts=8 sts=8 sw=8 noexpandtab
	autocmd Filetype php setlocal ts=4 sts=4 sw=4 noexpandtab
	autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
	autocmd Filetype gitcommit setlocal ts=4 sts=4 sw=4 expandtab
	autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
	autocmd Filetype eruby setlocal ts=2 sts=2 sw=2 expandtab
	autocmd Filetype css setlocal ts=2 sts=2 sw=2 expandtab
	autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
	autocmd Filetype sh setlocal ts=2 sts=2 sw=2 noexpandtab
	autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
	autocmd Filetype json setlocal ts=2 sts=2 sw=2 expandtab
	autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType vim setlocal ts=2 sts=2 sw=2 noexpandtab foldmethod=marker
	autocmd FileType rst setlocal ts=4 sts=4 sw=4
augroup END
" }}}

" Function {{{

" Html tag new line expander.
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

" Toggle when enter key press
" inoremap <CR> <C-R>=Expander()<CR>
au FileType html,javascript inoremap <CR> <C-R>=Expander()<CR>
" }}}
