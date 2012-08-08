set nocompatible
set backspace=indent,eol,start
set showmatch
set showcmd
set hlsearch
set incsearch
set ignorecase
set smartcase
set smarttab
set number
set ruler
set statusline=%f\ %y\ %m%r%=0x%-04B\ Col:%-3c\ Line:%l\/%L
set laststatus=2
syntax on
set softtabstop=4
set shiftwidth=4
set expandtab
set nobackup
set noswapfile
set hidden
filetype on
filetype plugin on
filetype indent on
set mouse=a
set scrolloff=2
nnoremap <silent> <F3> :Explore<CR>
nnoremap <silent> <F4> <C-w><C-w>
nnoremap <silent> <F5> :bp<CR>
nnoremap <silent> <S-F5> :bn<CR>
vnoremap <C-t> !perltidy -q<CR>

autocmd FileType perl set autoindent|set smartindent
autocmd FileType perl set showmatch

autocmd FileType html set softtabstop=2|set shiftwidth=2

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" localvimrc
let g:localvimrc_ask=0

" git blame for current line
fun! BlameCurrentLine()
    let lnum = line(".")
    let file = @%
    botright new
    setlocal buftype=nofile filetype=diff bufhidden=wipe nobuflisted noswapfile nowrap
    execute "$read !gitBlameFromLineNo " lnum file
    1
endfun
nmap <f2> :call BlameCurrentLine()<cr>
