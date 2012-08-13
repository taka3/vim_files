
let s:install_dir = expand('<sfile>:p:h')

" Set up command and parameters
if has("win32")
  "let s:cmd           = exists('g:jslint_cmd') ? g:jslint_cmd : 'cscript /NoLogo '
  "let s:runjslint_ext = exists('g:jslint_ext') ? g:jslint_ext : 'wsf'
  let s:cmd           = exists('g:jslint_cmd') ? g:jslint_cmd : 'cscript /NoLogo '
  let s:runjslint_ext = exists('g:jslint_ext') ? g:jslint_ext : 'wsf'
else
  let s:runjslint_ext = 'js'
  if exists("$JS_CMD")
    let s:cmd = "$JS_CMD"
  elseif executable('/System/Library/Frameworks/JavaScriptCore.framework/Resources/jsc')
    let s:cmd = '/System/Library/Frameworks/JavaScriptCore.framework/Resources/jsc'
  elseif executable('node')
    let s:cmd = 'node'
  elseif executable('js')
    let s:cmd = 'js'
  else
    echoerr('No JS interpreter found. Checked for jsc, js (spidermonkey), and node')
  endif
endif



let s:plugin_path = s:install_dir . '/../lib/'
let s:quote_mark = "'"
if has('win32')
  let s:plugin_path = substitute(s:plugin_path, '/', '\', 'g')
  let s:quote_mark = '"'
endif
let s:cmd = "cd " . s:plugin_path . " && " . s:cmd . ' ' . s:quote_mark . s:plugin_path . "runjslint." . s:runjslint_ext . s:quote_mark
if has('win32')
  " change drive
  let s:cmd = "cd " . matchstr(s:plugin_path , '^\a:') . " && " . s:cmd
endif


let s:jslintrc_file = expand('~/.jslintrc')
if filereadable(s:jslintrc_file)
  let s:jslintrc = readfile(s:jslintrc_file)
else
  let s:jslintrc = []
end
"
"
"
function! jslint#check()
  call jslint#clear()
  call s:do_jslint()
endfunction
"
"
"
"
function! jslint#message()
  if !exists('b:showing_message')
    let b:showing_message = 0
  endif

  let s:cursorPos = getpos(".")

  " Bail if RunJSLint hasn't been called yet
  if !exists('b:matchedlines')
    return
  endif

  if has_key(b:matchedlines, s:cursorPos[1])
    let s:jslintMatch = get(b:matchedlines, s:cursorPos[1])
    call s:echo_error(s:jslintMatch['message'])
    let b:showing_message = 1
    return
  endif

  if b:showing_message == 1
    echo
    let b:showing_message = 0
  endif
endfunction
"
"
"
function! jslint#clear()
  " Delete previous matches
  let s:matches = getmatches()
  for s:matchId in s:matches
    let match_id = s:matchId['group']
    if  match_id == 'JSLintError' || match_id == 'JSLintWarn'
      call matchdelete(s:matchId['id'])
    endif
  endfor
  let b:matched = []
  let b:matchedlines = {}
  let b:cleared = 1
endfunction




" echo_error() prints [long] message up to (&columns-1) length
" guaranteed without "Press Enter" prompt.
function! s:echo_error(msg)
  let x=&ruler | let y=&showcmd
  set noruler noshowcmd
  redraw
  echohl ErrorMsg | echo a:msg | echohl None
  let &ruler=x | let &showcmd=y
endfun



function! s:do_jslint()

  if exists("b:jslint_disabled") && b:jslint_disabled == 1
    return
  endif

  highlight link JSLintError SpellBad
  highlight JSLintWarn term=reverse ctermbg=12 gui=undercurl guisp=orange

  if exists("b:cleared")
    if b:cleared == 0
      call jslint#clear()
    endif
    let b:cleared = 1
  endif

  let b:matched = []
  let b:matchedlines = {}

  " Detect range
  if a:firstline == a:lastline
    " Skip a possible shebang line, e.g. for node.js script.
    if getline(1)[0:1] == "#!"
      let b:firstline = 2
    else
      let b:firstline = 1
    endif
    let b:lastline = '$'
  else
    let b:firstline = a:firstline
    let b:lastline = a:lastline
  endif

  let b:qf_list = []
  let b:qf_window_count = -1

  let lines = join(s:jslintrc + getline(b:firstline, b:lastline), "\n")
  if len(lines) == 0
    return
  endif
  let b:jslint_output = system(s:cmd, lines . "\n")
  if v:shell_error
    echoerr 'could not invoke JSLint!'
    echoerr s:cmd
    echoerr b:jslint_output
    let b:jslint_disabled = 1
  end

  let err_count  = 0
  let warn_count = 0

  for error in split(b:jslint_output, "\n")
    " Match {line}:{char}:{message}
    let b:parts = matchlist(error, '\v(\d+):(\d+):([A-Z]+):(.*)')
    if !empty(b:parts)
      let l:line = b:parts[1] + (b:firstline - 1 - len(s:jslintrc)) " Get line relative to selection
      let l:errorMessage = b:parts[4]

      " Store the error for an error under the cursor
      let s:matchDict = {}
      let s:matchDict['lineNum'] = l:line
      let s:matchDict['message'] = l:errorMessage
      let b:matchedlines[l:line] = s:matchDict
      if b:parts[3] == 'ERROR'
          let l:errorType = 'E'
          let err_count += 1
      else
          let l:errorType = 'W'
          let warn_count += 1
      endif
      if g:jslint_highlight_error_line == 1
        let match_id = l:errorType == 'E' ? 'JSLintError' : 'JSLintWarn'
        let s:mID = matchadd(match_id, '\v%' . l:line . 'l\S.*(\S|$)')
      endif
      " Add line to match list
      call add(b:matched, s:matchDict)

      " Store the error for the quickfix window
      let l:qf_item = {}
      let l:qf_item.bufnr = bufnr('%')
      let l:qf_item.filename = expand('%')
      let l:qf_item.lnum = l:line
      let l:qf_item.text = l:errorMessage
      let l:qf_item.type = l:errorType

      " Add line to quickfix list
      call add(b:qf_list, l:qf_item)
    endif
  endfor

  if exists("s:jslint_qf")
    " if jslint quickfix window is already created, reuse it
    call s:activate_quick_fix_window()
    call setqflist(b:qf_list, 'r')
  else
    " one jslint quickfix window for all buffers
    call setqflist(b:qf_list, '')
    let s:jslint_qf = s:get_quick_fix_stack_count()
  endif

  if exists('g:jslint_copen')
    if err_count != 0
      let err_count = err_count > 5 ? 5 : err_count
      cclose | execute 'copen ' . err_count
    else
      cclose
    endif
  else
    if err_count != 0 || warn_count != 0
      if err_count != 0
        echohl ErrorMsg
      else
        echohl WarningMsg
      end
      redraw
      echo  'jslint find ' . err_count . ' errors , ' . warn_count . ' warns' | echohl None
    endif
  endif


  let b:cleared = 0
endfunction


function! s:get_quick_fix_stack_count()
    let l:stack_count = 0
    try
        silent colder 9
    catch /E380:/
    endtry

    try
        for i in range(9)
            silent cnewer
            let l:stack_count = l:stack_count + 1
        endfor
    catch /E381:/
        return l:stack_count
    endtry
endfunction

function! s:activate_quick_fix_window()
    try
        silent colder 9 " go to the bottom of quickfix stack
    catch /E380:/
    endtry

    if s:jslint_qf > 0
        try
            exe "silent cnewer " . s:jslint_qf
        catch /E381:/
            echoerr "Could not activate JSLint Quickfix Window."
        endtry
    endif
endfunction


