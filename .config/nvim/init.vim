" ================================================================
" 基本設定
"================================================================

" エンコーディングを設定
set encoding=utf-8
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
" 現在の行を強調表示 (カーソル移動が重くなる)
" set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=3
" コマンドラインの補完
set wildmode=list,full
set wildignorecase
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
set clipboard+=unnamedplus
" 畳み込み禁止
set nofoldenable
" スクロールに行数の余裕をもたせる
set scrolloff=7

set conceallevel=0
set termguicolors


"================================================================
" 自動コマンド
"================================================================

" Quickfix の自動化
autocmd QuickFixCmdPost *grep* cwindow

" ペースト時の自動インデントと自動コメントアウトの無効化
autocmd FileType * setlocal formatoptions-=ro

"================================================================
" カーソル形状
"================================================================

set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor


"================================================================
" キーマップ
"================================================================

" ---------------------------------------------------------------
" ノーマルモード & ビジュアルモードでのキーマッピング

" コマンド入力のしやすさのため、コロンとセミコロン入れ替え
noremap ; :
noremap : ;

" Exモード無効
noremap Q <Nop>
noremap gQ <Nop>

" ---------------------------------------------------------------
" コマンドモード & 挿入モードでのキーマッピング

" カーソル移動系
noremap! <c-f> <right>
noremap! <c-b> <left>
noremap! <c-a> <home>
noremap! <c-e> <end>
noremap! <c-d> <del>
noremap <C-6> <C-^>

" ---------------------------------------------------------------
" ノーマルモードでのキーマッピング

" 行末までコピー
nnoremap Y y$
" インクリメント＆デクリメント
nnoremap + <c-a>
nnoremap - <c-x>
" 改行
nnoremap <Enter> o<Esc>
" ハイライト解除
nnoremap <Esc><Esc> :noh<CR>
" 上下と入れ替えてインデント調整
" nnoremap sj ddp==
" nnoremap sk ddkP==

nnoremap ≠ <c-w>+
nnoremap – <c-w>-
nnoremap ≤ <c-w><
nnoremap ≥ <c-w>>

" ---------------------------------------------------------------
" コマンドモードでのキーマッピング
cnoremap <c-p> <up>
cnoremap <c-n> <down>

" ---------------------------------------------------------------
" 挿入モードでのキーマッピング
" inoremap jj <Esc>
inoremap jk <Esc>
inoremap kj <Esc>


" ===============================================================
" Plugins
" プラグイン管理は "vim-plug" --> https://github.com/junegunn/vim-plug
"
" Install for Vim
"
" ```
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" ```
"
" Install for Neovim
"
" ```
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" ```
"
" プラグインを追加したら、このファイルを読み込み直して `:PlugInstall`
" を実行することでインストールされる
"
" ===============================================================

call plug#begin('~/.vim/plugged')

" Vimで非同期実行できるようにする
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" 日本語ヘルプ
Plug 'vim-jp/vimdoc-ja'
" カラースキーム
" Plug 'gosukiwi/vim-atom-dark'
Plug 'EdenEast/nightfox.nvim'
" ステータスバーなどの見た目を綺麗にする
" Plug 'itchyny/lightline.vim'
Plug 'nvim-lualine/lualine.nvim'
" Plug 'feline-nvim/feline.nvim'
" サイドバー表示のファイラ
Plug 'scrooloose/nerdtree'
" NERDTreeにファイルアイコンをつける
" アイコン対応フォントのインストールを推奨
Plug 'ryanoasis/vim-devicons'
" Plug 'kyazdani42/nvim-web-devicons'
" インデント可視化
Plug 'Yggdroot/indentLine'
" Normalモード <Ctrl-p> でファイルの選択を開く (fzf使えないとき用)
Plug 'kien/ctrlp.vim'
" あいまい検索インターフェース
" ファイル検索やgrepでよく使う
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" コメントアウトのトグル <Ctrl--> か <Ctrl-_> で使える
Plug 'tomtom/tcomment_vim'
" 記号とかで列を揃える
Plug 'junegunn/vim-easy-align'
" 対応するカッコやクォーテーションを自動で入力してくれる
Plug 'kana/vim-smartinput'
" カレントディレクトリを自動で変えてくれる
Plug 'airblade/vim-rooter'
" テキストを囲うものを編集しやすくする (カッコやタグなど)
Plug 'tpope/vim-surround'
" スニペット挿入
Plug 'SirVer/ultisnips'
" スニペット リスト
Plug 'honza/vim-snippets'
" Git操作をVimから。 :Gstatusが便利
Plug 'tpope/vim-fugitive'

" Linter
" Plug 'dense-analysis/ale'
" 補完
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" 言語サーバクライアント
" Plug 'autozimu/LanguageClient-neovim', {
"       \ 'branch': 'next',
"       \ 'do': 'bash install.sh',
"       \ }

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-lua/lsp-status.nvim'

" For ultisnips users.
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" 言語系
Plug 'plasticboy/vim-markdown'
Plug 'habamax/vim-asciidoctor'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'timonv/vim-cargo'
Plug 'neovimhaskell/haskell-vim'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'

" ruby on rails
" Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-haml'
" Plug 'slim-template/vim-slim'
" Plug 'cohama/vim-smartinput-endwise'
" Plug 'digitaltoad/vim-pug'
" Plug 'kchmck/vim-coffee-script'
" Plug 'szw/vim-tags'
" Plug 'ruby-formatter/rufo-vim'

" PHP
" Plug 'roxma/LanguageServer-php-neovim', {'do': 'composer install && composer run-script parse-stubs'}
" Plug 'beanworks/vim-phpfmt'

" front end
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'elmcast/elm-vim'
Plug 'leafgarland/typescript-vim'
" Plug 'prettier/vim-prettier', {
"     \ 'do': 'yarn install',
"     \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }

call plug#end()

" vimdoc-ja ヘルプを日本語優先にする
set helplang=ja,en

" vim-atom-dark カラースキーム設定
" colorscheme atom-dark-256
" colorscheme nightfox

" lightline カレントディレクトリからの相対パス
function! LightLineFilename()
  return expand('%')
endfunction

" lightline ステータスバーの表示設定
let g:lightline = {
            \ 'component': {
            \   'readonly': '%{&readonly?"":""}',
            \   'coordinate': '%c: %l/%L',
            \   'truncate': '%<',
            \   'bubo': "",
            \ },
            \ 'active': {
            \   'left': [['mode', 'paste'], ['filename', 'modified', 'readonly', 'gitbranch'], ['truncate']],
            \   'right': [['coordinate'], ['fileformat', 'fileencoding', 'filetype'], ['bubo', 'linter_errors', 'linter_warnings', 'linter_ok']]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'GitBranch'
            \ },
            \ 'separator': { 'left': "", 'right': " " },
            \ 'subseparator': { 'left': "", 'right': " " }
            \ }

" lightline タブバーの表示設定
let g:lightline.tabline = {
            \ 'left': [ [ 'tabs' ] ],
            \ 'right': [ [ 'close' ] ] }

" lightline 色の設定
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

" lightline コンポーネントが何を返すか
let g:lightline.component_expand = {
            \ 'tabs': 'lightline#tabs',
            \ 'linter_warnings': 'LightlineLinterWarnings',
            \ 'linter_errors': 'LightlineLinterErrors',
            \ 'linter_ok': 'LightlineLinterOK'
            \ }

" lightline コンポーネントの表示色
let g:lightline.component_type = {
            \ 'tabs': 'tabsel',
            \ 'readonly': 'error',
            \ 'linter_warnings': 'warning',
            \ 'linter_errors': 'error'
            \ }

" lightline 現在のgitブランチ
function! GitBranch() abort
  let l:branch = FugitiveHead()
  return l:branch == '' ? '' : printf(" %s", branch)
endfunction

" lightline ALEのエラー数
" ale
" function! LightlineLinterErrors() abort
"   let l:counts = ale#statusline#Count(bufnr(''))
"   let l:all_errors = l:counts.error + l:counts.style_error
"   let l:all_non_errors = l:counts.total - l:all_errors
"   return l:counts.total == 0 ? '' : printf("%d ", all_errors)
" endfunction

" lightline ALEの警告数
" ale
" function! LightlineLinterWarnings() abort
"   let l:counts = ale#statusline#Count(bufnr(''))
"   let l:all_errors = l:counts.error + l:counts.style_error
"   let l:all_non_errors = l:counts.total - l:all_errors
"   return l:counts.total == 0 ? '' : printf("%d ", all_non_errors)
" endfunction

" lightline OK
" ale
" function! LightlineLinterOK() abort
"   let l:counts = ale#statusline#Count(bufnr(''))
"   let l:all_errors = l:counts.error + l:counts.style_error
"   let l:all_non_errors = l:counts.total - l:all_errors
"   return l:counts.total == 0 ? "" : ''
" endfunction

" lightline Lint時にlightline表示更新
" ale
" augroup LightLineOnALE
"   autocmd!
"   autocmd User ALELint call lightline#update()
" augroup END

" fzf 表示領域
let g:fzf_layout = { 'down': '~70%' }
" fzf 選択キー
let g:fzf_commands_expect = 'enter'

" fzf Git内ファイル検索(gitignore対象は除外し、Untracked filesは含む)
command! -bang -nargs=* GitFiles
    \ call fzf#vim#gitfiles('--exclude-standard -co')

" fzf ripgrepによる高速grep
if executable('rg')
    command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --line-number --no-heading '.shellescape(<q-args>), 0,
        \   fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'up:50%:wrap'))
endif

function! CdFind(dir)
  cd `=a:dir`
  edit `=a:dir`
  GFiles
  if has('nvim')
    call feedkeys('i', 'n')
  endif
endfunction

if executable('ghq')
  command! -bang -nargs=0 Ghq
    \ call fzf#run({
    \   'source': 'ghq list --full-path',
    \   'sink': function('CdFind')})
endif

" fzf コマンド検索
nnoremap <Space>p :Commands<CR>
" fzf ホームディレクトリからのファイル検索
" nnoremap <silent> <Space>ff :Files ~/<CR>
" fzf Gitプロジェクト内のファイル検索
nnoremap <Space>o :GitFiles<CR>
" fzf ファイル履歴検索
nnoremap <Space>h :History<CR>
" fzf バッファ検索
nnoremap <Space>b :Buffers<CR>
" fzf カレントディレクトリ以下でgrep検索
nnoremap <Space>g :Rg<CR>

" NERDTree 現在のファイルを選択した状態でファイラを開く
nnoremap <Space>f :NERDTreeFind<CR>
" NERDTree ファイラの表示切り替え
nnoremap <Space>t :NERDTreeToggle<CR>

" fugitive git status
nnoremap <silent> <Space>s :Git<CR>

" ctrlp <Ctrl-p>でファイル履歴を検索
let g:ctrlp_cmd = 'CtrlPMRUFiles'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,result:50'
let g:ctrlp_root_markers = ['.git', 'Cargo.toml', 'stack.yaml', 'Gemfile']
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_mruf_max = 500
let g:ctrlp_open_new_file = 'h'
let g:ctrlp_use_migemo = 1
if executable('rg')
    let g:ctrlp_user_command = 'rg %s --files --hidden --no-ignore --follow --color=never --glob "!.git/*"'
    let g:ctrlp_use_caching = 0
endif

" vim-smartinput-endwise rubyでdoに対応するendを自動入力
"call smartinput_endwise#define_default_rules()

" ale 諸設定
" let g:ale_set_highlights = 1
" let g:ale_fix_on_save = 1
" let g:ale_linters = { 'rust': ['analyzer'] }
"       \ 'ruby': ['rubocop']
"       \ }
      " \ 'javascript': ['prettier']
" let g:ale_fixers = {
"       \ 'javascript': ['prettier']
"       \ }
" let g:ale_sign_column_always = 1
" let g:ale_javascript_prettier_use_local_config = 1

" ruby
compiler ruby
let ruby_space_errors=1

" if has('mac')
"     let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"     let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" endif

" カーソル表示
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[0 q"

let g:deoplete#enable_at_startup = 1

" スニペットを別filetypeでも使えるようにする
augroup UltiSnipsFiletypeAdding
  autocmd FileType javascript UltiSnipsAddFiletypes html
augroup end

" UltiSnips スニペット展開
let g:UltiSnipsExpandTrigger="<c-k>"
" UltiSnips スニペット次の位置に移動
let g:UltiSnipsJumpForwardTrigger="<c-j>"
" UltiSnips スニペット前の位置に戻る
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" UltiSnips スニペットエディタの表示方法
let g:UltiSnipsEditSplit="vertical"

" vim-devicons 諸設定
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
" dir-icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''
" file-icons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['txt'] = ''

augroup RubyFormat
  autocmd Filetype ruby setlocal softtabstop=2
  autocmd Filetype ruby setlocal sw=2
  autocmd Filetype ruby setlocal ts=2
augroup end

" rustfmt
let g:rustfmt_autosave = 1

" vim-rooter
let g:rooter_change_directory_for_non_project_files = 'current'

" vim-prettier (formatter for js, ts, etc...)
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue Prettier

" filetypeごとにインデント幅を設定
augroup IndentSetting
  autocmd!
  autocmd FileType text setlocal shiftwidth=4
  autocmd FileType markdown setlocal shiftwidth=4
augroup end

" markdownはテキストを隠さない
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Enable rufo (RUby FOrmat)
let g:rufo_auto_formatting = 0
let g:rufo_silence_errors = 0

" Vim
let g:indentLine_color_term = 239

" GVim
let g:indentLine_color_gui = '#43494C'

" 自作スニペット置場
let g:UltiSnipsSnippetsDir = '~/.vim/snippets'
set runtimepath+=~/.vim/snippets

" PHP
let g:phpfmt_autosave = 0

" JSON ダブルクオート表示
let g:vim_json_syntax_conceal = 0

" Mac vimr用
if has('gui_vimr')
    " cursorlineすると遅くなる
    set nocursorline
endif

function! IncrementCmdHeight()
  let &cmdheight += 1
endfunction

function! DecrementCmdHeight()
  let &cmdheight -= 1
endfunction

nnoremap <silent> <Space>+ :call IncrementCmdHeight()<CR>
nnoremap <silent> <Space>- :call DecrementCmdHeight()<CR>

command! Filepath echo expand('%:p')

" ==========================================================================
" config by lua
" ==========================================================================

lua << EOF

-- colorscheme

vim.cmd("colorscheme nightfox")

-- lualine config
--### Default Separators
--| Name                 | Value |
--| `vertical_bar`       | `'┃'` |
--| `vertical_bar_thin`  | `'│'` |
--| `left`               | `''` |
--| `right`              | `''` |
--| `block`              | `'█'` |
--| `left_filled`        | `''` |
--| `right_filled`       | `''` |
--| `slant_left`         | `''` |
--| `slant_left_thin`    | `''` |
--| `slant_right`        | `''` |
--| `slant_right_thin`   | `''` |
--| `slant_left_2`       | `''` |
--| `slant_left_2_thin`  | `''` |
--| `slant_right_2`      | `''` |
--| `slant_right_2_thin` | `''` |
--| `left_rounded`       | `''` |
--| `left_rounded_thin`  | `''` |
--| `right_rounded`      | `''` |
--| `right_rounded_thin` | `''` |
--| `circle`             | `'●'` |

--

local lsp_status = require('lsp-status')
require('lualine').setup({
  sections = {
    lualine_c = { 'filename' }
  }
})

-- lsp config
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>l", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- -- ★ これ
-- nvim_lsp.rust_analyzer.setup{
--   on_attach = on_attach,
-- }

nvim_lsp.tsserver.setup{
  on_attach = on_attach,
}

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
    -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  end,
  },
mapping = {
  ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
  ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
  ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
  ['<C-e>'] = cmp.mapping({
  i = cmp.mapping.abort(),
  c = cmp.mapping.close(),
  }),
['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
},
    sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
    }, {
    { name = 'buffer' },
    })
  })

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
    }
  })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
  { name = 'path' }
  }, {
  { name = 'cmdline' }
  })
})

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['rust-analyzer'].setup {
  --   capabilities = capabilities
  --   }

EOF
