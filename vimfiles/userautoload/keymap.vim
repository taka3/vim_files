"-------------------------------------------------------------------
" key mapping----------------------------------------------------
"-------------------------------------------------------------------

"Esc�L�[��JJJ�ŏo����悤��
inoremap jjj <Esc>

"zz�S�I����Ctrl-a��
inoremap <C-a> <Esc>ggvG$
nnoremap <C-a> ggvG$
"�\��t�����A�J�[�\���̑O��
nnoremap p P

"����
nnoremap <C-w> <Esc>:quit<CR>
"�^�u�ړ�
map <C-Tab> <ESC>:tabn<CR>
map <C-S-Tab> <ESC>:tabp<CR>
"�V�K�^�u�쐬
map <C-S-n> <ESC>:tabe<CR>

imap <C-Tab> <ESC>:tabn<CR>
imap <C-S-Tab> <ESC>:tabp<CR>
"�V�K�^�u�쐬
imap <C-S-n> <ESC>:tabe<CR>

"$home�ɂ��ǂ��āAUnite���N��
map :ho <ESC>:cd $home<CR>,ua
"�t�@�C���S�̂̃C���f���g�𒲐�
map <C-S-i> <ESC>gg=G
imap <C-S-i> <ESC>gg=G
