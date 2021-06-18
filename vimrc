"2021061012272520210610122725202106101227252021061012272520210610122725202106101227252021061012272202106101227255 Leader Mappings
let mapleader=" "
let maplocalleader=" "

" Specify a directory for plugins. 
call plug#begin('~/.vim/plugged')

" Close and change between buffers
Plug 'moll/vim-bbye'
  nnoremap <Leader>w :Bdelete<CR>
  nnoremap <Leader>n :bnext<CR>
  nnoremap <Leader>b :Buffers<CR>
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
  " Recently edited files
  map <Leader>h :History<CR>
  " search files
  map <Leader>o :Files<CR>
  map <C-o> :GFiles<CR> 
  map <C-f> :Rg! 

" Gruvbox Community theme.
Plug 'gruvbox-community/gruvbox'

" Navigate and manipulate files in a tree view.
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-mapping-mark-children.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'

" Toggle comments in various ways.
Plug 'tpope/vim-commentary'

" A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'
  set laststatus=2
  if !has('gui_running')
	  set t_Co=256
  endif
  set noshowmode

" Automatically show Vim's complete menu while typing.
Plug 'vim-scripts/AutoComplPop'
 
  " Languages and file types.
Plug 'cakebaker/scss-syntax.vim'
Plug 'chr4/nginx.vim'
Plug 'chrisbra/csv.vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'godlygeek/tabular' | Plug 'tpope/vim-markdown'
Plug 'jvirtanen/vim-hcl'
Plug 'lifepillar/pgsql.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-git'
Plug 'tpope/vim-liquid'
Plug 'vim-python/python-syntax'
Plug 'wgwoods/vim-systemd-syntax'
Plug 'lervag/vimtex'

" Git
Plug 'tpope/vim-fugitive'
  nnoremap <Leader>d :Git diff<CR>
  nnoremap <Leader>s :Git status<CR>
Plug 'mhinz/vim-signify'


" PHP syntax
Plug 'StanAngeloff/php.vim'
Plug '2072/PHP-Indenting-for-VIm'

Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/vim-vsnip'
  " Expand
  imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         :'<C-j>'
  smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         :'<C-j>'
  " Expand or jump
  imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
  smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

  " Jump forward or backward
  imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
  smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
  imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
  smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>' 

  call plug#end()


" Enable syntax highlighting.
syntax on

" Set the color scheme.
colorscheme gruvbox
set background=dark



set autoread                          " Auto reload changed files  
set clipboard^=unnamed,unnamedplus
set nowrap                            " Don't wrap long lines  
set noerrorbells novisualbell         " Turn off visual and audible bells
set autoindent
set backspace=indent,eol,start

" Set the directory of the swap file
" The // indicates that the swap name should be globally unique
set directory=~/.vim/tmp//,/tmp

" set colorcolumn=80
"-------------------------------------------------------------------------------
" Interface                                                                     
"-------------------------------------------------------------------------------
                                                                                
set number relativenumber      " Enable line numbers                                     
set scrolloff=5       " Leave 5 lines of buffer when scrolling                  
set sidescrolloff=10  " Leave 10 characters of horizontal buffer when scrolling 

set complete+=kspell
set completeopt=menuone,longest

set cursorline

set mouse=a
set ruler

set showmatch
set wildmenu			" Tab autocomplete in command mode 
set wildmode=full
set wrap

" Persistent undo                                                                                                                                                                                                             
set undodir=~/.vim/undo/                                                        
set undofile                                                                    
set undolevels=1000                                                             
set undoreload=10000 

nnoremap <Leader>vimrc :e $MYVIMRC<CR>

" Navigate around splits with a single key combo.
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>

" Cycle through splits.
nnoremap <S-Tab> <C-w>w

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" Make sure all types of requirements.txt files get syntax highlighting.
autocmd BufNewFile,BufRead requirements*.txt set ft=python

" Make sure .aliases, .bash_aliases and similar files get syntax highlighting.
autocmd BufNewFile,BufRead .*aliases set ft=sh

" Ensure tabs don't get converted to spaces in Makefiles.
autocmd FileType make setlocal noexpandtab


" Only show the cursor line in the active buffer.
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" .............................................................................
" lambdalisue/fern.vim
" .............................................................................

" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

let g:fern#renderer = "nerdfont"

" augroup my-fern-hijack
"   autocmd!
"   autocmd BufEnter * ++nested call s:hijack_directory()
" augroup END

" function! s:hijack_directory() abort
"   let path = expand('%:p')
"   if !isdirectory(path)
"     return
"   endif
"   bwipeout %
"   execute printf('Fern %s', fnameescape(path))
" endfunction

" Custom settings and mappings.
let g:fern#disable_default_mappings = 1

noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> h <Plug>(fern-action-hidden-toggle)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> k <Plug>(fern-action-mark)
  nmap <buffer> K <Plug>(fern-action-mark-children:leaf)
  nmap <buffer> b <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END


