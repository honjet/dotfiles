set background=dark
" ウィンドウの縦幅
set lines=48
" ウィンドウの横幅
set columns=80

set linespace=2

" 半透明化
set transparency=10

function! s:toggle_transparence()
    if &transparency == 10
        set transparency=0
    else
        set transparency=10
    endif
endfunction
nnoremap <silent> <Space>tt :<C-u>call <SID>toggle_transparence()<CR>

set guifont=Cica:h15

" メニューバー非表示
set guioptions-=m
" ツールバー非表示
set guioptions-=T
" スクロールバー非表示
set guioptions-=r
set guioptions-=L
" タブバーの表示
set guioptions-=e
set showtabline=2
set cmdheight=1
set cursorline

set visualbell t_vb=

" 選択にコマンドラインを使用
set guioptions+=c
