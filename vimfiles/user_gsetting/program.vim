"-------------------------------------------------------------------
"setting for programming language-----------------------------------
"-------------------------------------------------------------------
"Javascript
au FileType javascript set ts=4 sw=4 expandtab
au BufNewFile *.js set ft=javascript fenc=utf-8

"JS�̎���
:set dictionary=dict/javascript.dict
"�g���q�ŁA���򂷂�悤�ɐݒ肵�Ă����A�����PHP�݂̂̐ݒ�Ȃ̂ł��܂�֌W�Ȃ����L�q���Ă����B
autocmd FileType javascript :set dictionary=~/vimfiles/dict/javascript.dict
"JS�t�@�C�����J���Ƃ���Shift-JIS�ɂ���
autocmd FileType javascript :set encoding = shift_jis


"�s���̃X�y�[�X�폜
"function! RTrim()
"let s:cursor = getpos(�g.�h)
"%s/\s\+$//e
"call setpos(�g.�h, s:cursor)
"endfunction
"autocmd BufWritePre *.php,*.rb,*.js,*.bat call RTrim()

