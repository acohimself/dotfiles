" Specify a directory for plugins.
call plug#begin('~/.vim/plugged')


" Gruvbox Community theme.
Plug 'gruvbox-community/gruvbox'

" Navigate and manipulate files in a tree view.
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-mapping-mark-children.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'

" Toggle comments in various ways.
Plug 'tpope/vim-commentary'

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
" Git
Plug 'tpope/vim-fugitive'
  nmap     <Leader>g :Gstatus<CR>gg<c-n>
  nnoremap <Leader>d :Gdiff<CR>

 
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

" Leader Mappings
let mapleader=" "
let maplocalleader=" "

" Recently edited files
"map <Leader>h :History<CR>

set autoread                          " Auto reload changed files  
set clipboard=unnamedplus	      " Clipboard support (OSX)
set nowrap                            " Don't wrap long lines  
set noerrorbells novisualbell         " Turn off visual and audible bells
set autoindent
set backspace=indent,eol,start
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
set showmode
set wildmenu			" Tab autocomplete in command mode 
set wildmode=full
set wrap

" Persistent undo                                                                                                                                                                                                             
set undodir=~/.vim/undo/                                                        
set undofile                                                                    
set undolevels=1000                                                             
set undoreload=10000 
" -----------------------------------------------------------------------------
" Status line
" -----------------------------------------------------------------------------

" Heavily inspired by: https://github.com/junegunn/dotfiles/blob/master/vimrc
function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return '[%n] %f %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction

let &statusline = s:statusline_expr()





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

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

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


