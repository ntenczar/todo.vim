" Stuff for T O D O list -------------------------
" shortcuts for adding/removing checkmarks on .todo files
nmap <leader>d :s/- /- ✅ /<cr><esc><c-o>
nmap <leader>f :s/- ✅ /- /<cr><esc><c-o>

" Get a file-width string of today's date
function! s:GetTodayBuff()
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

function! HighlightCategories()

end

command TodoDate call append(0, GetTodayBuff()) append(1, '')
