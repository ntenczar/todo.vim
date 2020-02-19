" Vim syntax file
" Language:     Todo
" Maintainer:   Nate Tenczar <ntenczar@gmail.com>
" Filenames:    *.todo

if exists("b:current_syntax")
  finish
endif

function DictToString(dict)
  let s = ""
  for i in keys(a:dict)
    let s = s . i . '=' . a:dict[i] . ' '
  endfor
  return s
endfunction

function StyleTag(tag, style)
  let groupName = a:tag . "Group"
  let tagName = a:tag . "Tag"
  let config = DictToString(a:style)
  let createHighlight = "hi " . groupName . " " . config
  let createSyn = "syn match " . tagName . " /\\[". a:tag . "\\]/"
  let createLink = "highlight link ". tagName . " " . groupName
  exe createHighlight
  exe createSyn
  exe createLink
endfunction

" == special formatting ==
" grays out an item with a checkmark
syn match doneLine /\s*- ✅.*/
hi doneGroup ctermfg=darkgray
highlight link doneLine doneGroup
" == end special ==

" color codes helpfully grabbed from:
" https://jonasjacek.github.io/colors/

call StyleTag("work", { "ctermfg": '99' })
call StyleTag("beer", { "ctermfg": '94'})
call StyleTag("bike", { "ctermfg": '232'})
call StyleTag("misc", { "ctermfg": '196'})
call StyleTag("life", { "ctermfg": '31'})
