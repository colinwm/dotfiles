inoremap jk <ESC>
nmap ; :
set tabstop=4
set ignorecase
set expandtab
set number
set incsearch
set hlsearch
set nowrap

let mapleader = " "

" Fix the clipboard
set clipboard=unnamed

" Single character deletes shouldn't fill default register.
noremap x "_x
" Visual mode pastes shouldn't fill default register.
vnoremap p "_dP
nnoremap Y Y

func! LoadGitBuffers()
  let files = systemlist('files')
  if len(getbufinfo({'buflisted':1})) <= 1
    for file in files
      execute "e " . fnameescape(file)
    endfor
  endif
  execute ":Buffers"
endf
com! -nargs=0 LoadGitBuffers call LoadGitBuffers()

nnoremap <leader>pp :LoadGitBuffers<CR>
map <c-p> :FZF<CR>
nnoremap <leader>ps :Lines<CR>

let g:rustfmt_autosave = 1
let g:rustfmt_command = "rustfmt"

call plug#begin()
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'rust-lang-nursery/rustfmt'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

set background=light
colorscheme PaperColor
