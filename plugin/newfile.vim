"
"" - Commands to run when files are created/opened/saved/closed -
"

function! ModifyHeader()
  let current_cursor_pos = getcurpos()
  call cursor(1,1)

  let date_line_no = search("Modified:", '', 4)
  if date_line_no != 0
    exe "s/Modified:.*/Modified: " .strftime("%c")
  else
    echom "No code header"
  endif

  call setpos('.', current_cursor_pos)
endfunction


autocmd Bufwritepre,filewritepre *.cpp call ModifyHeader()
autocmd Bufwritepre,filewritepre *.{h,hpp} call ModifyHeader()
