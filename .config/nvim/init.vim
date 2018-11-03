"================================================================
" 基本設定
"================================================================

" エンコーディングを設定
set fenc=utf-8
scriptencoding utf-8

" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 終了時の保存確認
set confirm
"タイトルバーにファイルパス情報等の表示をする
set title
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list,full
" コマンドラインの高さ
set cmdheight=1
" タブページ表示
set showtabline=2
" 不可視文字を可視化
set list listchars=tab:>-,trail:~
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=2
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" 置換時に g オプションをデフォルトでつける
set gdefault
" カーソルの回り込みを可能に
set whichwrap=b,s,h,l,[,],<,>
" BackSpace を空白、行頭、行末でも可能に
set backspace=indent,eol,start
" クリップボードへのコピー
set clipboard+=unnamed,unnamedplus
" 畳み込み禁止
set nofoldenable
" スクロールに行数の余裕をもたせる
set scrolloff=7

"================================================================
" 自動コマンド
"================================================================

" Quickfix の自動化
autocmd QuickFixCmdPost *grep* cwindow

" ディレクトリ自動変更
" autocmd BufEnter * execute 'lcd ' fnameescape(expand('%:p:h'))
" autocmd BufEnter * if expand('%:p') !~ '://' | execute 'lcd ' fnameescape(expand('%:p:h')) | endif

" ペースト時の自動インデントと自動コメントアウトの無効化
autocmd FileType * setlocal formatoptions-=ro

"================================================================
" カーソル形状
"================================================================

set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

"================================================================
" キーマップ
"================================================================

" ノーマルモード & ビジュアルモードでのキーマッピング
noremap ; :
noremap : ;
noremap Q <Nop>

" コマンドモード & 挿入モードでのキーマッピング
noremap! <c-f> <right>
noremap! <c-b> <left>
noremap! <c-a> <home>
noremap! <c-e> <end>
noremap! <c-d> <del>

" ノーマルモードでのキーマッピング
nnoremap Y y$
nnoremap + <c-a>
nnoremap - <c-x>
nnoremap <Enter> o<Esc>
nnoremap <Esc><Esc> :noh<CR>

" コマンドモードでのキーマッピング
cnoremap <c-p> <up>
cnoremap <c-n> <down>

" 挿入モードでのキーマッピング
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kj <Esc>
inoremap <c-j> <Esc>o
inoremap <c-BS> <c-w>

" ===============================================================
" Plugin
" ===============================================================

call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-jp/vimdoc-ja'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'honjet/hydrangea-vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'kana/vim-smartinput'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-surround'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-endwise', { 'for': ['ruby']}

Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'timonv/vim-cargo'
Plug 'tpope/vim-rails'
Plug 'ruby-formatter/rufo-vim'
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'elmcast/elm-vim'
Plug 'mattn/emmet-vim'

Plug 'w0rp/ale'
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
" Plug 'roxma/nvim-completion-manager'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'pbogut/deoplete-elm'
Plug 'dzhou121/gonvim-fuzzy'
Plug 'equalsraf/neovim-gui-shim'

call plug#end()

function! LightLineFilename()
  return expand('%')
endfunction

let g:lightline = {
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \   'bubo': "",
      \ },
      \ 'active': {
      \   'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified'], ['bubo']],
      \   'right': [['percent', 'lineinfo'], ['fileformat', 'fileencoding', 'filetype'], ['linter_errors', 'linter_warnings', 'linter_ok']]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'GitBranch'
      \ },
      \ 'separator': { 'left': "", 'right': " " },
      \ 'subseparator': { 'left': " ", 'right': " " }
      \ }
let g:lightline.tabline = {
      \ 'left': [ [ 'tabs' ] ],
      \ 'right': [ [ 'close' ] ] }

" lightline 色の設定
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
" let g:lightline#colorscheme#powerline#palette = lightline#colorscheme#fill(s:p)
let g:lightline.component_expand = {
      \ 'tabs': 'lightline#tabs',
      \ 'linter_warnings': 'LightlineLinterWarnings',
      \ 'linter_errors': 'LightlineLinterErrors',
      \ 'linter_ok': 'LightlineLinterOK'
      \ }
let g:lightline.component_type = {
      \ 'tabs': 'tabsel',
      \ 'readonly': 'error',
      \ 'linter_warnings': 'warning',
      \ 'linter_errors': 'error'
      \ }

function! GitBranch() abort
  let l:branch = fugitive#head()
  return l:branch == '' ? '' : printf(" %s", branch)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf("%d ", all_errors)
endfunction

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf("%d ", all_non_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? "" : ''
endfunction

autocmd User ALELint call lightline#update()

let g:fzf_commands_expect = 'enter'
if executable('rg')
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \ 'rg --line-number --no-heading '.shellescape(<q-args>), 1,
        \ <bang>0 ? fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'up:50%:wrap')
        \         : fzf#vim#with_preview('right:50%:hidden', '?'),
        \ <bang>0)
endif
nnoremap <Space>p :Commands<CR>
nnoremap <Space>ff :Files ~/<CR>
nnoremap <Space>fg :GFiles<CR>
nnoremap <Space>fh :History<CR>
nnoremap <Space>fb :Buffers<CR>
nnoremap <Space>g :Rg!<CR>
nnoremap <Space>rg :Rg<CR>

nnoremap <Space>fn :NERDTreeFind<CR>
nnoremap <Space>ft :NERDTreeToggle<CR>

let g:LanguageClient_serverCommands = {
      \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
      \ 'haskell': ['hie-wrapper', '--lsp'],
      \ 'html': ['html-languageserver', '--stdio'],
      \ 'css': ['css-languageserver', '--stdio'],
      \ 'vue': ['vls'],
      \ }
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <Space>lr :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <Space>ls :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent> <Space>le :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> <Space>lf :call LanguageClient_textDocument_formatting()<CR>
nnoremap <silent> <Space>lF :call LanguageClient_textDocument_rangeFormatting()<CR>

let g:ale_linters = {
      \   'haskell': ['hlint'],
      \   'rust': ['rls'],
      \}

" completion
" let g:cm_refresh_length=1
" let g:cm_completed_snippet_enable = 1

let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('_',  'max_menu_width', 0)
call deoplete#custom#source('_',  'max_abbr_width', 0)
call deoplete#custom#source('_',  'max_kind_width', 0)

let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

set runtimepath+=~/.vim/ultisnips/
let g:UltiSnipsSnippetDir = '~/.vim/ultisnips/snippets'

" vim-devicons
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
" dir-icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" ale
let g:ale_sign_column_always = 1

" rustfmt
let g:rustfmt_autosave = 1

" Enable rufo (RUby FOrmat)
let g:rufo_auto_formatting = 1
let g:rufo_silence_errors = 1

" vim-rooter
let g:rooter_change_directory_for_non_project_files = 'current'

" haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

set background=dark
set termguicolors
colorscheme atom-dark
