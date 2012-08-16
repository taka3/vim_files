"personal setting file for vim
set guioptions& guioptions+=M
"クリップボードをWindowsと連携
set clipboard=unnamed
"backupを作らない
"set nobackup
" スワップファイルの作成は行わない
"set noswapfile
"モードラインの無効化
set nomodeline
"バックアップファイルの保存場所を設定
set backupdir=C:\vim73\vimbackup
"スワップファイルの保存場所を設定
set directory=C:\vim73\vimswap

"Pathogen--------------------------
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" neocomplcache--------------------
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化f

" autocomplepop--------------------
"補完候補を出したまま改行できるようにする
"inoremap <expr> <CR> pumvisible() ? "\<C-Y>\<CR>" : "\<CR>"

"ポップアップ補完メニュー色設定（通常の項目、選択されている項目、スクロールバー、スクロールバーのつまみ部分）
highlight Pmenu ctermbg=7 ctermfg=0
highlight PmenuSel ctermbg=6 ctermfg=0
highlight PmenuSbar ctermbg=3
highlight PmenuThumb ctermbg=0 guibg=Red
"hi Pmenu ctermbg=8
"hi PmenuSel ctermbg=12
"hi PmenuSbar ctermbg=0


" jslint.vim-----------------------
function! s:javascript_filetype_settings()
  autocmd BufLeave     <buffer> call jslint#clear()
  autocmd BufWritePost <buffer> call jslint#check()
  autocmd CursorMoved  <buffer> call jslint#message()
endfunction
autocmd FileType javascript call s:javascript_filetype_settings()

"Unite-----------------------------
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
call unite#custom_default_action('file', 'tabopen')
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file <CR>

"Vim Twitter Setting
let twitvim_count = 40
"TwitVimのキーマップ設定
nnoremap ,tp :<C-u>PosttoTwitter<CR>
nnoremap ,tf :<C-u>FriendsTwitter<CR><C-w>j
nnoremap ,tu :<C-u>UserTwitter<CR><C-w>j
nnoremap ,tr :<C-u>RefreshTwitter<CR><C-w>j
nnoremap ,tre :<C-u>RepliesTwitter<CR><C-w>j
nnoremap ,tld :<C-u>ListTwitter daily<CR><C-w>j

"Powerlineの見た目を変える
set encoding=utf-8
"set guifont=Envy_Code_R_for_Powerline:h12
"let g:Powerline_symbols = 'fancy'

" 分割した設定ファイルをすべて読み込む
set runtimepath+=~/vimfiles/
runtime! user_setting/*.vim
