" �J���[�ݒ�
"colorscheme slate
"set background=light
"colorscheme solarized
syntax enable
":let g:zenburn_high_Contrast=1
colorscheme zenburn

" �J�[�\���s���n�C���C�g
set cursorline

" �J�����g�E�B���h�E�ɂ̂݌r��������
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END

"�n�C���C�g�ݒ�
:hi clear CursorLine
":hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=#323232
highlight Visual guibg=#777777
highlight ErrorMsg guifg=red
highlight IncSearch guibg=darkyellow
highlight Search guibg=darkyellow
"���s�����܂�ڗ����Ȃ��悤��
hi NonText guifg=#666666
hi SpecialKey guifg=#666666
"�Ή����銇�ʂ����Â炢�iZenburn with JS�j�̂ŁA���₷���B
hi MatchParen guifg=#ffd700 guibg=#555555 gui=bold

"--------------------------------------------------------------------------
""�}�����[�h���A�X�e�[�^�X���C���̐F��ύX
"--------------------------------------------------------------------------
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=orange gui=none ctermfg=blue ctermbg=yellow cterm=none'
let g:hi_normal = 'highlight StatusLine guifg=orange guibg=darkblue gui=none ctermfg=white ctermbg=yellow cterm=none'
if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    silent! let s:slhlcmd = 'highlight' . s:GetHighlight('StatusLine')
    silent exec g:hi_normal
"    highlight clear StatusLine
"    silent exec s:slhlcmd
endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

".gvimrc �J���[�ݒ�
"�J���[�ݒ肵�����CursorIM���`������@
if has('multi_byte_ime')
  highlight Cursor guifg=#555555 guibg=#ffd700
  highlight CursorIM guifg=NONE guibg=Purple
endif
