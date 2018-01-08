" ------------------------
" python specific settings
" ------------------------

" UI
" {{{

setlocal expandtab tabstop=2 shiftwidth=2

" }}}

" Keymaps
" {{{

nnoremap <silent> <F5> :AsyncRun -raw python %<CR>
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

" }}}
