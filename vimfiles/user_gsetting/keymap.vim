"EscキーをJJJで出来るように
inoremap jjj <Esc>

"zz全選択をCtrl-aで
inoremap <C-a> <ESC><ESC>ggvG$
nnoremap <C-a> <ESC>ggvG$
"貼り付けを、カーソルの前に
nnoremap p P

"$homeにもどって、Uniteを起動
map ,ho <ESC><ESC>:cd $home<CR>,ua
"MyDocumentに移動
map ,doc <ESC><ESC>:cd C:\Documents and Settings\works\My Documents<CR>
"ファイル全体のインデントを調整
nnoremap <C-S-i> <ESC><ESC>gg=G
"inoremap <C-S-i> <ESC>gg=G

"閉じる

map <C-q> <ESC><Esc>:quit<CR>
imap <C-q> <Esc><ESC>:quit<CR>
"新規タブ作成
map <C-S-n> <ESC><ESC>:tabe<CR>
map <C-Tab> <ESC><ESC>:tabn<CR>
map <C-S-Tab> <ESC><ESC>:tabp<CR>
imap <C-S-n> <ESC>:tabe<CR>
imap <C-Tab> <ESC>:tabn<CR>
imap <C-S-Tab> <ESC>:tabp<CR>

