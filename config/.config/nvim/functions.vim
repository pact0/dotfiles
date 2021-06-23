"######################################################################
" FUNCTIONS
"######################################################################
function! Rnvar()
  let word_to_replace = expand("<cword>")
  let replacement = input("new name: ")
  execute '%s/\(\W\)' . word_to_replace . '\(\W\)/\1' . replacement . '\2/gc'
endfunction


