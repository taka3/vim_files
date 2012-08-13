" カラー設定
colorscheme slate

"--------------------------------------------------------------------------
""挿入モード時、ステータスラインの色を変更
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

".gvimrc カラー設定
"カラー設定した後にCursorIMを定義する方法
if has('multi_byte_ime')
  highlight Cursor guifg=NONE guibg=Darkyellow
  highlight CursorIM guifg=NONE guibg=Purple
endif
