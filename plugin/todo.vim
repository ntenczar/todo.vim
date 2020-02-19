" Stuff for T O D O list -------------------------
" shortcuts for adding/removing checkmarks on .todo files
nmap <leader>d :s/- /- ✅ /<cr><esc><c-o>
nmap <leader>f :s/- ✅ /- /<cr><esc><c-o>
command TodoDate <g-g>=trftime('%a %b %d')<C-M>
