"Get wal colors
exec "source " . $HOME . "/.cache/wal/colors-wal.vim"

"Plugins
call plug#begin()
Plug 'dylanaraps/wal.vim'
Plug 'tpope/vim-vinegar'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'vimwiki/vimwiki'
Plug 'Yggdroot/indentLine'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'evanleck/vim-svelte'
Plug 'coc-extensions/coc-svelte'
Plug 'heavenshell/vim-jsdoc'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

"Plugin config


"" Deoplete
"let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"" Built-in nvim LSP config
"lua << EOF
"require'nvim_lsp'.bashls.setup{}
"require'nvim_lsp'.html.setup{}
"require'nvim_lsp'.cssls.setup{}
"require'nvim_lsp'.tsserver.setup{}
"require'nvim_lsp'.pyls.setup{}
"require'nvim_lsp'.vuels.setup{
"  init_options = {
"    vetur = {
"      autoImport = true,
"    }
"  }
"}
"EOF
"set omnifunc=v:lua.vim.lsp.omnifunc


"COC
set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


"" Nerdtree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeShowHidden=1


"" Ale
let g:ale_sign_error = '∙ '
let g:ale_sign_warning = '! '


"" jsdoc
let g:jsdoc_lehre_path = '~/lib/lehre'


"" IndentLine
let g:indentLine_setColors = 0
let g:indentLine_char = '▏'
let g:ale_linters = {
\  'javascript': ['eslint'],
\}

let g:ale_fixers = {
\  'javascript': ['eslint'],
\}

let g:ale_fix_on_save = 1


" NeoSnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


" Housekeeping
set noswapfile


"UI
set laststatus=0
set noruler
set noshowmode
set noshowcmd


"Formatting
set nocompatible
filetype plugin on
syntax on
set nu rnu
set nowrap
set tabstop=2 shiftwidth=2 expandtab
set autoindent
set hidden
set mouse=a "Because I'm only a hacker in name
set fillchars=vert:\ 


" Colors
syntax enable
colorscheme wal
hi LineNr ctermfg=cyan
hi CursorLineNr ctermfg=red
hi CursorLine   cterm=NONE ctermbg=NONE ctermfg=NONE
hi VertSplit	cterm=NONE ctermbg=NONE ctermfg=NONE
hi TabLineFill cterm=none ctermfg=cyan  ctermbg=none
hi TabLine     cterm=none ctermfg=cyan ctermbg=none
hi TabLineSel  cterm=none ctermfg=black ctermbg=cyan
hi Conceal cterm=bold ctermfg=cyan
autocmd ColorScheme * highlight VertSplit cterm=NONE cterm=NONE


" Life improvements
set autochdir
set clipboard=unnamedplus


"Commands
command! -bang -nargs=* PRg
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'dir': system('git -C '.expand('%:p:h').' rev-parse --show-toplevel 2> /dev/null')[:-2]}, <bang>0)


" Maps
nnoremap <S-J> :bnext<CR>
nnoremap <S-K> :bprev<CR>
nnoremap <C-P> :GFiles<CR>
nnoremap <C-S> :PRg<CR>
nnoremap <C-B> :Buffers<CR>


" TMUX fixes
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif

let g:svelte_preprocessors = ['typescript']
