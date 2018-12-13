"================================================================
" 基本設定
"================================================================

" エンコーディングを設定
set encoding=utf-8
set fenc=utf-8
scriptencoding utf-8

" 自動生成ファイルの出力先指定
" neovimじゃないとデフォルトで変なところに出力されるのでまとめる
if !has('nvim')
    let back_path = expand('~/.vim/backup')
    let swap_path = expand('~/.vim/swap')
    let info_path = expand('~/.vim/viminfo')
    let undo_path = expand('~/.vim/undo')

    if !isdirectory(back_path)
        call mkdir(back_path, "p")
    endif
    if !isdirectory(swap_path)
        call mkdir(swap_path, "p")
    endif
    if !isdirectory(info_path)
        call mkdir(info_path, "p")
    endif
    if !isdirectory(undo_path)
        call mkdir(undo_path, "p")
    endif

    set backupdir=~/.vim/backup
    set directory=~/.vim/swap
    set viminfo+=n~/.vim/viminfo/viminfo.txt
    set undodir=~/.vin/undo
endif

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
set laststatus=2
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
nnoremap <Space><Enter> o<Esc>
" ハイライト解除
nnoremap <Esc><Esc> :noh<CR>
" 上下と入れ替えてインデント調整
nnoremap sj ddp==
nnoremap sk ddkP==

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
Plug 'gosukiwi/vim-atom-dark'
" ステータスバーなどの見た目を綺麗にする
Plug 'itchyny/lightline.vim'
" サイドバー表示のファイラ
Plug 'scrooloose/nerdtree'
" NERDTreeにファイルアイコンをつける
" Cicaフォントのインストールを推奨 --> https://github.com/miiton/Cica
Plug 'ryanoasis/vim-devicons'
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
Plug 'w0rp/ale'
" 補完
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" 言語サーバクライアント
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }

" 言語系
Plug 'plasticboy/vim-markdown'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'timonv/vim-cargo'
Plug 'neovimhaskell/haskell-vim'
Plug 'pangloss/vim-javascript'

" ruby on rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'
Plug 'cohama/vim-smartinput-endwise'
Plug 'digitaltoad/vim-pug'
Plug 'kchmck/vim-coffee-script'
Plug 'szw/vim-tags'
Plug 'ruby-formatter/rufo-vim'

" PHP
Plug 'roxma/LanguageServer-php-neovim', {'do': 'composer install && composer run-script parse-stubs'}
Plug 'beanworks/vim-phpfmt'

" front end
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'elmcast/elm-vim'
Plug 'leafgarland/typescript-vim'
Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }

call plug#end()

" vimdoc-ja ヘルプを日本語優先にする
set helplang=ja,en

" vim-atom-dark カラースキーム設定
colorscheme atom-dark-256

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
  let l:branch = fugitive#head()
  return l:branch == '' ? '' : printf(" %s", branch)
endfunction

" lightline ALEのエラー数
" ale
function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf("%d ", all_errors)
endfunction

" lightline ALEの警告数
" ale
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf("%d ", all_non_errors)
endfunction

" lightline OK
" ale
function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? "" : ''
endfunction

" lightline Lint時にlightline表示更新
" ale
augroup LightLineOnALE
  autocmd!
  autocmd User ALELint call lightline#update()
augroup END

" fzf 表示領域
let g:fzf_layout = { 'down': '~70%' }
" fzf 選択キー
let g:fzf_commands_expect = 'enter'

" fzf ripgrepによる高速grep
if executable('rg')
    command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --line-number --no-heading '.shellescape(<q-args>), 0,
        \   fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'up:50%:wrap'))
endif

" fzf コマンド検索
nnoremap <Space>p :Commands<CR>
" fzf ホームディレクトリからのファイル検索
" nnoremap <silent> <Space>ff :Files ~/<CR>
" fzf Gitプロジェクト内のファイル検索
nnoremap <Space>f :GFiles<CR>
" fzf ファイル履歴検索
nnoremap <Space>h :History<CR>
" fzf バッファ検索
nnoremap <Space>b :Buffers<CR>
" fzf カレントディレクトリ以下でgrep検索
nnoremap <Space>g :Rg<CR>

" NERDTree 現在のファイルを選択した状態でファイラを開く
nnoremap <Space>n :NERDTreeFind<CR>
" NERDTree ファイラの表示切り替え
nnoremap <Space>e :NERDTreeToggle<CR>

" fugitive git status
nnoremap <silent> <Space>s :<C-u>Gstatus<CR><Esc>

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
call smartinput_endwise#define_default_rules()

" ale 諸設定
let g:ale_set_highlights = 1
" let g:ale_fix_on_save = 1
" let g:ale_linters = {
"       \ 'javascript': ['prettier']
"       \ }
" let g:ale_fixers = {
"       \ 'javascript': ['prettier']
"       \ }
let g:ale_sign_column_always = 1
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

if has('nvim')
    " python3 設定
    let g:python3_host_prog = '/usr/local/bin/python3'
    " ruby設定
    let g:ruby_host_prog = '~/.rbenv/versions/2.4.3/bin/neovim-ruby-host'
    " LanguageClient
    " 各言語の Language Server 設定
    let g:LanguageClient_serverCommands = {
                \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
                \ 'haskell': ['hie', '--lsp'],
                \ 'html': ['html-languageserver', '--stdio'],
                \ 'css': ['css-languageserver', '--stdio'],
                \ 'javascript': ['javascript-typescript-stdio'],
                \ 'typescript': ['javascript-typescript-stdio'],
                \ }
    let g:LanguageClient_autoStart = 1

    " LanguageClient カーソル下のドキュメント表示
    nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
    " LanguageClient カーソル下の定義ジャンプ
    nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
    " LanguageClient カーソル下のリネーム
    nnoremap <silent> <Space>lr :call LanguageClient_textDocument_rename()<CR>
    " LanguageClient シンボルリスト
    nnoremap <silent> <Space>ls :call LanguageClient_textDocument_documentSymbol()<CR>
    " LanguageClient カーソル下の参照リスト
    nnoremap <silent> <Space>ll :call LanguageClient_textDocument_references()<CR>
    " LanguageClient テキスト整形
    nnoremap <silent> <Space>lf :call LanguageClient_textDocument_formatting()<CR>
    " LanguageClient 範囲のテキスト整形
    nnoremap <silent> <Space>lF :call LanguageClient_textDocument_rangeFormatting()<CR>
endif

let g:deoplete#enable_at_startup = 1

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

autocmd Filetype ruby setlocal softtabstop=2
autocmd Filetype ruby setlocal sw=2
autocmd Filetype ruby setlocal ts=2

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

" Enable rufo (RUby FOrmat)
let g:rufo_auto_formatting = 0
let g:rufo_silence_errors = 0

" Vim
let g:indentLine_color_term = 239

" GVim
let g:indentLine_color_gui = '#43494C'

" 自作スニペット置場
set runtimepath+=~/.vim/snippets
let g:UltiSnipsSnippetsDir = '~/.vim/snippets'

" PHP
let g:phpfmt_autosave = 0

" Mac vimr用
if has('gui_vimr')
    " cursorlineすると遅くなる
    set nocursorline
endif

command! Filepath echo expand('%:p')
command! InitVim e ~/.config/nvim/init.vim
command! FishConfig e ~/.config/fish/config.fish
