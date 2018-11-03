if exists('g:GtkGuiLoaded')
    call rpcnotify(1, 'Gui', 'Font', 'Cica 15')
    " call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
    " call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
    let g:GuiInternalClipboard = 1
else
    Guifont! Cica:h15
    GuiLinespace 0
    " let g:gonvim_draw_statusline = 0
    " let g:gonvim_draw_tabline = 0
    " let g:gonvim_draw_split = 0
endif



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
" 選択にコマンドラインを使用
set guioptions+=c

set visualbell t_vb=

