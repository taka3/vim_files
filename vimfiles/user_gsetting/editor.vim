"setting for editor-----------------------------------------------
"タブの代わりに空白文字を挿入する
set expandtab
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"タブ文字、行末など不可視文字を表示する
set list
"listで表示される文字のフォーマットを指定する
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:$
"ファイル内の <Tab> が対応する空白の数
set tabstop=4
" インデントの各段階に使われる空白の数
set shiftwidth=4
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch


"setting for search function------------------------------------------------
"ハイライトサーチを利用
set hlsearch
"インクリメンタルサーチを行う
set incsearch
" 検索パターンにおいて大文字と小文字を区別しない。
set ignorecase
"検索時に大文字を含んでいたら大/小を区別
set smartcase
