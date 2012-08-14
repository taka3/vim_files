"-------------------------------------------------------------------
"setting for programming language-----------------------------------
"-------------------------------------------------------------------
"Javascript
au FileType javascript set ts=4 sw=4 expandtab
au BufNewFile *.js set ft=javascript fenc=utf-8

"JSの辞書
:set dictionary=dict/javascript.dict
"拡張子で、分岐するように設定しておく、今回はPHPのみの設定なのであまり関係ないが記述しておく。
autocmd FileType javascript :set dictionary=~/vimfiles/dict/javascript.dict
"JSファイルを開くときはShift-JISにする
autocmd FileType javascript :set encoding = shift_jis


"行末のスペース削除
"function! RTrim()
"let s:cursor = getpos(“.”)
"%s/\s\+$//e
"call setpos(“.”, s:cursor)
"endfunction
"autocmd BufWritePre *.php,*.rb,*.js,*.bat call RTrim()

