" CTAGS CHEAT SHEET
" Ctrl+] - go to definition
" Ctrl+T - Jump back from the definition.
" Ctrl+W Ctrl+] - Open the definition in a horizontal split
" set binary
" set noeol
" put swap files in backups directory
" set backupdir=~/.vim/backups
" set directory=~/.vim/backups
set nocompatible
filetype off
syntax on
" filetype indent off
filetype plugin on
filetype plugin indent on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'elm.vim'
Plugin 'https://github.com/tikhomirov/vim-glsl.git'
Plugin 'https://github.com/ajh17/VimCompletesMe.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'https://github.com/smerrill/vcl-vim-plugin'
Plugin 'https://github.com/luochen1990/rainbow'
Plugin 'https://github.com/tpope/vim-fugitive'
Plugin 'https://github.com/hylang/vim-hy'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'https://github.com/justinmk/vim-syntax-extra'
Plugin 'https://github.com/vim-syntastic/syntastic'
Plugin 'https://github.com/zcodes/vim-colors-basic'
Plugin 'https://github.com/StanAngeloff/php.vim'
" Plugin 'https://github.com/airblade/vim-rooter'
Plugin 'https://github.com/yegappan/grep'
Plugin 'https://github.com/vim-airline/vim-airline'
Plugin 'https://github.com/ctrlpvim/ctrlp.vim'
Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'https://github.com/nathanaelkane/vim-indent-guides'
Plugin 'https://github.com/joshdick/onedark.vim'
Plugin 'https://github.com/tpope/vim-sleuth'
Plugin 'https://github.com/Vimjas/vim-python-pep8-indent'
Plugin 'tomasiser/vim-code-dark'
Plugin 'https://github.com/soramugi/auto-ctags.vim'
call vundle#end()

set nobackup
set ignorecase
set shell=/bin/bash
set autoindent
set smartindent
set t_Co=256
set t_ut=
" colorscheme codedark
set incsearch
"set wildmode=list
set wildmode=longest,list,full
set wildmenu
colo onedark

" autocmd FileType c set tags+=/usr/local/include
set laststatus=2
set number
set modelines=1

nnoremap E eli

" map K :call ReadMan()<CR>
" map <C-o> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>:wincmd r<CR>
map <C-o> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-m> :SyntasticToggleMode<CR>
" map <C-i> :call ReadMan()<CR>
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
map <C-_> <leader>c<space>

let mapleader = ","
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
" let g:ctrlp_user_command = 'pwd > test.pwd.txt | echo main.c'
" let g:auto_ctags = 1
let g:ctrlp_map = '<c-p>'
" let g:ctrlp_user_command = 'find . -type f | grep -v "\.git" | fzf -0 --select-1 -f %s'
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_working_path_mode = 'c'


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

autocmd vimenter * NERDTree
autocmd FileType text,markdown let b:vcm_tab_complete = 'omni'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd vimenter * wincmd l

command! M !make
command! FormatCurl %s/ -H/ \\\r-H/g | %s/ -X/ \\\r-X/g 
command! R execute ':call RunMake()'

fun! ReadMan()
  let s:man_word = expand('<cword>')
  :exe ":wincmd n"
  :exe ":r!man -S2:3:1 " . s:man_word . " | col -b"
  :exe ":goto"
  :exe ":delete"
endfun

fun! RunMake()
  :silent exec ":!make run &> ./.output.txt"
  :exe ":wincmd w"
  :exe ":view ./.output.txt"
  :exe ":wincmd w"
  :exe ":redraw!"
endfun

