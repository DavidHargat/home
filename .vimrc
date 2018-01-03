" CTAGS CHEAT SHEET
" Ctrl+] - go to definition
" Ctrl+T - Jump back from the definition.
" Ctrl+W Ctrl+] - Open the definition in a horizontal split
"
set nocompatible

" VUNDLE
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
Plugin 'https://github.com/zcodes/vim-colors-basic'
Plugin 'https://github.com/StanAngeloff/php.vim'
Plugin 'https://github.com/airblade/vim-rooter'
Plugin 'https://github.com/yegappan/grep'
" Plugin 'https://github.com/NLKNguyen/vim-lisp-syntax'
" Plugin 'https://github.com/kovisoft/slimv'
" Plugin 'https://github.com/vim-scripts/VimClojure'
call vundle#end()


" let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
:let mapleader = ","

" commenting
:map <leader>, <leader>c<space>
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
" let g:NERDCompactSexyComs = 1
" let g:php_syntax_extensions_enabled = 1

command! M !make

autocmd FileType text,markdown let b:vcm_tab_complete = 'omni'

" put swap files in backups directory
" set backupdir=~/.vim/backups
" set directory=~/.vim/backups
set nobackup


" CUSTOM
" vplay port to vim
:command! -nargs=1 Vplay execute ':silent :!bash ~/bashs/vplay.sh '.<f-args>.'&' | redraw!

filetype off
filetype indent off
filetype plugin on
syntax on
filetype plugin indent on

set shell=/bin/bash

set autoindent

" 2 spaces indentation for js
syntax on
au BufNewFile,BufRead *.javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.js         setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.html       setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.php        setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead *.json       setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.c          setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
au BufNewFile,BufRead *.scm        setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.lua        setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" au BufNewFile,BufRead *.scheme     setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" au BufNewFile,BufRead *.sch set syntax=scheme

set t_Co=256

colo basic-dark

"set relativenumber
" set list
" hi SpecialKey ctermbg=8
" set listchars=tab:\ \ 

" cursor highlighting
" hi! link LineNr NonText
" hi! link CursorLineNr Type
" hi! link CursorLine Normal
" hi Normal ctermbg=234
" set cursorline

set wildmode=list

" add system headers to ctags
set tags+=~/Documents/personal/usr/include/tags

" hi Comment cterm=italic

" Ctrl-p - Open the definition in a vertical split
map <C-p> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>:wincmd r<CR>

" read man pages in vim
fun! ReadMan()
  " Assign current word under cursor to a script variable:
  let s:man_word = expand('<cword>')
  " Open a new window:
  :exe ":wincmd n"
  " Read in the manpage for man_word (col -b is for formatting):
  :exe ":r!man -S2:3:1 " . s:man_word . " | col -b"
  " Goto first line...
  :exe ":goto"
  " and delete it:
  :exe ":delete"
endfun

" Map the K key to the ReadMan function:
map K :call ReadMan()<CR>

fun! RunMake()
  :silent exec ":!make run &> ./.output.txt"
  :exe ":wincmd w"
  :exe ":view ./.output.txt"
  :exe ":wincmd w"
  :exe ":redraw!"
endfun
:command! R execute ':call RunMake()'

nnoremap E eli

set laststatus=2
set statusline+=col:\ %c,
set number

" set statusline=
" set statusline +=%1*\ %n\ %*            "buffer number
" set statusline +=%5*%{&ff}%*            "file format
" set statusline +=%3*%y%*                "file type
" set statusline +=%4*\ %<%F%*            "full path
" set statusline +=%2*%m%*                "modified flag
" set statusline +=%1*%=%5l%*             "current line
" set statusline +=%2*/%L%*               "total lines
" set statusline +=%1*%4v\ %*             "virtual column number
" set statusline +=%2*0x%04B\ %*          "character under cursor
" set statusline +=%{fugitive#statusline()}\ %* " git status line

set statusline=
set statusline +=\ %n\             "buffer number
set statusline +=%{&ff}            "file format
set statusline +=%y                "file type
set statusline +=\ %<%F            "full path
set statusline +=%m                "modified flag
set statusline +=%=%5l             "current line
set statusline +=/%L               "total lines
set statusline +=%4v\              "virtual column number
set statusline +=0x%04B\           "character under cursor
set statusline +=%{fugitive#statusline()}\  " git status line


command! FormatCurl %s/ -H/ \\\r-H/g | %s/ -X/ \\\r-X/g 

set modelines=1
set binary
set noeol
