"-------------------------------------------------------------------
" key mapping----------------------------------------------------
"-------------------------------------------------------------------

"EscキーをJJJで出来るように
inoremap jjj <Esc>

"zz全選択をCtrl-aで
inoremap <C-a> <Esc>ggvG$
nnoremap <C-a> ggvG$
"貼り付けを、カーソルの前に
nnoremap p P

"閉じる
nnoremap <C-w> <Esc>:quit<CR>
"タブ移動
map <C-Tab> <ESC>:tabn<CR>
map <C-S-Tab> <ESC>:tabp<CR>
"新規タブ作成
map <C-S-n> <ESC>:tabe<CR>

imap <C-Tab> <ESC>:tabn<CR>
imap <C-S-Tab> <ESC>:tabp<CR>
"新規タブ作成
imap <C-S-n> <ESC>:tabe<CR>

"$homeにもどって、Uniteを起動
map :ho <ESC>:cd $home<CR>,ua
"ファイル全体のインデントを調整
map <C-S-i> <ESC>gg=G
imap <C-S-i> <ESC>gg=G
