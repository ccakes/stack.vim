"
" stack.vim
"
" A (poor) implementation of a tiling window manager for Vim.
"

" if v:version < 740
"   echo 'stack.vim requires at least Vim 7.4'
"   finish
" endif

if exists('g:stack_loaded')
  finish
endif

let g:stack_loaded = 1
let g:stack_version = '0.1'

"
" Setup some default config values
"
if !exists('g:stack#config#min_columns')
  let g:stack#config#min_columns = 160
endif

if !exists('g:stack#config#min_lines')
  let g:stack#config#min_lines = 70
endif

if !exists('g:stack#config#default_mapping')
  let g:stack#config#default_mapping = 1
endif

"
" Commands
"
command! -nargs=0 StackNewWindow      call stack#NewWindow()
command! -nargs=0 StackCloseWindow    call stack#CloseWindow()
command! -nargs=0 StackPromoteWindow  call stack#PromoteWindow()

"
" Setup default mappings
"
if exists('g:stack#config#default_mapping')
  nnoremap <silent> <C-n> :StackNewWindow<CR>
  nnoremap <silent> <C-c> :StackCloseWindow<CR>
  nnoremap <silent> <C-l> :StackPromoteWindow<CR>
endif

