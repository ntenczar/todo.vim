" Vim syntax file
" Language:     Todo
" Maintainer:   Nate Tenczar <ntenczar@gmail.com>
" Filenames:    *.todo

if exists("b:current_syntax")
  finish
endif

syn match doneLine /\s*- ✅.*/
" grays out an item with a checkmark
hi doneGroup ctermfg=darkgray
highlight link doneLine doneGroup

" shortcuts for adding/removing checkmarks on .todo files
nmap <leader>d :s/- /\=todo_check_with_space<cr><esc><c-o> :noh<cr><esc>
nmap <leader>f :s/- ./-/<cr><esc><c-o> :noh<cr><esc>

" fg_code may be any one of:
" https://jonasjacek.github.io/colors/
function! s:style_tag(tag, fg_code)
  let group_name = a:tag . "Group"
  let tag_name = a:tag . "Tag"
  let create_highlight = "hi " . group_name . " ctermfg=" . a:fg_code
  let create_syn = "syn match " . tag_name . " /\\[". a:tag . "\\]/"
  let create_link = "highlight link ". tag_name . " " . group_name
  exe create_highlight
  exe create_syn
  exe create_link
endfunction

function! s:highlight_categories_for_todo(categories)
 for category in items(a:categories)
   let cat = category[0]
   let fg_code = category[1]
   call s:style_tag(cat, fg_code)
 endfor
endfunction

if exists('g:todo_categories')
  let categories = get(g:, 'todo_categories')
  call s:highlight_categories_for_todo(categories)
endif
