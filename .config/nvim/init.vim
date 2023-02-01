inoremap jk <ESC>
nmap ; :
set ignorecase
set expandtab
set number
set incsearch
set hlsearch
set nowrap

let mapleader = " "

set expandtab
set tabstop=2
set shiftwidth=2

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
nnoremap <leader>d :CocDiagnostics<CR>

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
Plug 'neoclide/coc.nvim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
call plug#end()

let g:coc_global_extensions = [ 'coc-tsserver', 'coc-prettier', 'coc-solargraph' ]

" Use enter to select CoC suggestion
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

set background=light
colorscheme PaperColor
