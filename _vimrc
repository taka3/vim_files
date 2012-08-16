"personal setting file for vim
set guioptions& guioptions+=M
"�N���b�v�{�[�h��Windows�ƘA�g
set clipboard=unnamed
"backup�����Ȃ�
"set nobackup
" �X���b�v�t�@�C���̍쐬�͍s��Ȃ�
"set noswapfile
"���[�h���C���̖�����
set nomodeline
"�o�b�N�A�b�v�t�@�C���̕ۑ��ꏊ��ݒ�
set backupdir=C:\vim73\vimbackup
"�X���b�v�t�@�C���̕ۑ��ꏊ��ݒ�
set directory=C:\vim73\vimswap

"Pathogen--------------------------
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" neocomplcache--------------------
let g:neocomplcache_enable_at_startup = 1 " �N�����ɗL����f

" autocomplepop--------------------
"�⊮�����o�����܂܉��s�ł���悤�ɂ���
"inoremap <expr> <CR> pumvisible() ? "\<C-Y>\<CR>" : "\<CR>"

"�|�b�v�A�b�v�⊮���j���[�F�ݒ�i�ʏ�̍��ځA�I������Ă��鍀�ځA�X�N���[���o�[�A�X�N���[���o�[�̂܂ݕ����j
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
" �ŋߎg�p�����t�@�C���ꗗ
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
call unite#custom_default_action('file', 'tabopen')
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file <CR>

"Vim Twitter Setting
let twitvim_count = 40
"TwitVim�̃L�[�}�b�v�ݒ�
nnoremap ,tp :<C-u>PosttoTwitter<CR>
nnoremap ,tf :<C-u>FriendsTwitter<CR><C-w>j
nnoremap ,tu :<C-u>UserTwitter<CR><C-w>j
nnoremap ,tr :<C-u>RefreshTwitter<CR><C-w>j
nnoremap ,tre :<C-u>RepliesTwitter<CR><C-w>j
nnoremap ,tld :<C-u>ListTwitter daily<CR><C-w>j

"Powerline�̌����ڂ�ς���
set encoding=utf-8
"set guifont=Envy_Code_R_for_Powerline:h12
"let g:Powerline_symbols = 'fancy'

" ���������ݒ�t�@�C�������ׂēǂݍ���
set runtimepath+=~/vimfiles/
runtime! user_setting/*.vim
