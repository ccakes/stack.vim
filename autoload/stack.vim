"
" Calculate layout to use based on the size of the Vim
" session
"
function! stack#CalcLayout()
  if (&columns < g:stack#config#min_columns || &lines > g:stack#config#min_lines)
    let g:stack#config#layout = 'h-stack'
  else
    let g:stack#config#layout = 'v-stack'
  endif

  if winnr('$') >= 4
    let g:stack#config#layout = 'n' . g:stack#config#layout
  endif
endfunction

"
" Shuffle windows to prep for new master
"
function! stack#Shuffle()
  " Only 1 window?
  if winnr('$') == 1
    return
  endif

  let l:curr = winnr()

  if g:stack#config#layout == 'h-stack'
    windo wincmd H
    " exec l:curr . 'wincmd K'
  elseif g:stack#config#layout == 'v-stack'
    windo wincmd K
    " exec l:curr . 'wincmd H'
  endif
endfunction

"
" Create new window and rearrange
"
function! stack#NewWindow()
  call stack#CalcLayout()
  call stack#Shuffle()

  if g:stack#config#layout == 'h-stack'
    topleft new
  elseif g:stack#config#layout == 'v-stack'
    topleft vnew
  elseif g:stack#config#layout == 'nh-stack'
    rightbelow vnew
  elseif g:stack#config#layout == 'nv-stack'
    rightbelow new
  endif
endfunction

"
" Close current window (if not last)
"
function! stack#CloseWindow()
  if winnr('$') == 1
    return
  endif

  let l:curr = winnr()
  if &modified
    bdelete l:curr
  endif

  if winnr() == 1
    close
    wincmd =
  else
    close
  endif
endfunction

"
" Promote selected window to master
"
function! stack#PromoteWindow()
  if winnr('$') == 1 || winnr() == 1
    return
  endif

  let l:cur_win = winnr()
  let l:cur_buf = bufnr('%')
  let l:cur_view = winsaveview()

  1wincmd w

  let l:target_buf = bufnr('%')
  let l:target_view = winsaveview()

  " hide and open to keep history and unsaved changes
  exec 'hide buf ' . l:cur_buf
  call winrestview(l:cur_view)

  exec l:cur_win . 'wincmd w'
  exec 'hide buf ' . l:target_buf
  call winrestview(l:target_view)

  " switch to main
  1wincmd w
endfunction

"
" Debug
"
function! stack#debug(msg)
  if exists('g:stack#config#debug')
    echom '[D]' . a:msg
  endif
endfunction

