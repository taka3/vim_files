"-------------------------------------------------------------------
" useful setting----------------------------------------------------
"-------------------------------------------------------------------
"normalモードでもEnterキーで改行可能に
noremap <CR> i<CR><ESC>

"検索結果に移動したとき、その位置を画面の中央にします。
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

"ブラケット入力時にスムーズに編集できるように。
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>
inoremap () ()
""inoremap []5 [%  %]<LEFT><LEFT><LEFT>
""inoremap {}5 {%  %}<LEFT><LEFT><LEFT>
