"personal setting file for vim
set guioptions& guioptions+=M
"--------------------------------------------------------------------------
"setting for Plugin
"--------------------------------------------------------------------------
"Pathogen--------------------------
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" neocomplcache--------------------
let g:neocomplcache_enable_at_startup = 1 " �N�����ɗL����f

" jslint.vim-----------------------
function! s:javascript_filetype_settings()
  autocmd BufLeave     <buffer> call jslint#clear()
  autocmd BufWritePost <buffer> call jslint#check()
  autocmd CursorMoved  <buffer> call jslint#message()
endfunction
autocmd FileType javascript call s:javascript_filetype_settings()

"Unite-----------------------------
" �ŋߎg�p�����t�@�C���ꗗ
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" ESC�L�[��2�񉟂��ƏI������
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
call unite#custom_default_action('file', 'tabopen')
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

"Vim Twitter Setting
"let twitvim_login_b64 = 'taka_mura3:MHQxYTJrM2E='
"let twitvim_count = 100
"Powerline�̌����ڂ�ς���
set encoding=utf-8
"set guifont=Envy_Code_R_for_Powerline:h12
"let g:Powerline_symbols = 'fancy'
