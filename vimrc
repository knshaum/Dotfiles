set nocompatible
set backspace=indent,eol,start
set showmatch
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
vnoremap <C-t> !perltidy -q<CR>
nnoremap <silent> <F4> <C-w><C-w>
nnoremap <silent> <F5> :bp<CR>
nnoremap <silent> <S-F5> :bn<CR>

autocmd FileType perl set autoindent|set smartindent
autocmd FileType perl set showmatch

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>
