" todo.vim - Shortcuts for managing a todo list in vim
" Maintainer:   Nate Tenczar <ntenczar@gmail.com>
" Version:      0.1

" Define the *.todo filetype
filetype on
au BufNewFile,BufRead *.todo set filetype=todo.html

" Get a file-width string of today's date
function! s:get_today_buff()
  if exists('g:todo_today_buf_char')
    let buf_char = get(g:, 'todo_today_buf_char')
  else
    let buf_char = '='
  endif

  if exists('g:todo_today_cols')
    let cols = get(g:, 'todo_today_cols')
  else
    let cols = 80
  endif

  if exists('g:todo_today_date_format')
    let date_format = get(g:, 'todo_today_date_format')
  else
    let date_format = '%a %b %d'
  endif

  let today = " " . strftime(date_format) . " "
  let today_len = strlen(today)
  let buffer_len = (cols - today_len - 1) / 2
  let buf = ""
  while buffer_len > 0
    let buf = buf . buf_char
    let buffer_len -= 1
  endwhile
  return buf . today . buf
endfunction

if exists('g:todo_check_char')
  let todo_check_char = get(g: ,'todo_check_char')
else
  let todo_check_char = '✅'
endif

let todo_check_with_space = '- ' . todo_check_char . ' '

command TodoDate call append(0, s:get_today_buff())
