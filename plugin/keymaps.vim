"" - Key mappings for vim -

let mapleader=" "
let g:use_operator_flashy = 1
let g:use_incsearch = 1

" Navigation
" {{{

" Line movement
map <Leader><Leader>/ <Plug>(easymotion-sn)
map <Leader><Leader>l <Plug>(easymotion-lineforward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><Leader>h <Plug>(easymotion-linebackward)

" Fold movement
"" Replace the zj zk calls to move to next closed fold
nnoremap <silent> zj :call NextClosedFold('j')<CR>
nnoremap <silent> zk :call NextClosedFold('k')<CR>

" Buffer Movement
nnoremap <silent> <C-l> :CtrlSpaceGoDown<CR>
nnoremap <silent> <C-h> :CtrlSpaceGoUp<CR>

" Tab movement
noremap <C-Left> :tabp<CR>
noremap <C-Right> :tabn<CR>

" }}}

" UI Related
" {{{
nnoremap <Leader><Leader> zz
nnoremap <Leader>zz :let &scrolloff=810-&scrolloff<CR>
nnoremap <Leader>rf :set foldlevel=0<CR>

" Toggles for quickfix consistent with vim-unimpaired
" Toggle-command from the vim-togglelist plugin
nnoremap [oq :copen<cr>
nnoremap ]oq :cclose<cr>

" Reformat current paragraph
nnoremap <Leader>ff gqip

" More easily accessible file completion
inoremap <C-F> <C-X><C-F>

" Easier access to only
nnoremap <Leader>o :only<cr>

" Disable EX mode
nnoremap Q <NOP>

if exists("g:use_operator_flashy") && g:use_operator_flashy
  " Replace yank with flashy-yank that highlights yanked area
  map y <Plug>(operator-flashy)
  nmap Y <Plug>(operator-flashy)$
endif

if exists("g:use_incsearch") && g:use_incsearch
  " Use incsearch.vim as default search function
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)

  " let incsearch manage hlsearch
  set hlsearch
  let g:incsearch#auto_nohlsearch = 1
  map n  <Plug>(incsearch-nohl-n)
  map N  <Plug>(incsearch-nohl-N)
  map *  <Plug>(incsearch-nohl-*)
  map #  <Plug>(incsearch-nohl-#)
  map g* <Plug>(incsearch-nohl-g*)
  map g# <Plug>(incsearch-nohl-g#)
endif

" }}}

" Plugin keymaps
" {{{


"" Vim-CtrlSpace
"" {{{
let g:CtrlSpaceDefaultMappingKey = "<C-b>"
"" }}}

"" vim-clang-format
"" {{{
autocmd FileType c,cpp nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp vnoremap <buffer><Leader>cf :ClangFormat<CR>
"" }}}

"" NERDCommenter
"" {{{
let NERDComInsertMap='<C-C>'
"" }}}

"" NERDTree
"" {{{
map <C-N> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"" }}}

"" CtrlP
"" {{{
"" Use a leader instead of the actual named binding
nmap <silent> <leader>p :CtrlP<cr>

"" Easy bindings for its various modes
nmap <silent> <leader>bb :CtrlPBuffer<cr>
nmap <silent> <leader>bm :CtrlPMixed<cr>
nmap <silent> <leader>bs :CtrlPMRU<cr>
"" }}}

"" vim-buffergator
"" {{{
"" View the entire list of buffers open
nnoremap <silent> <Leader>bl :BuffergatorOpen<cr>
"" }}}

"" Gundo
"" {{{
nnoremap <silent> <Leader>uu :GundoToggle<CR>
"" }}}

"" fugitive.vim
"" {{{
nnoremap <silent> <Leader>gg :Gstatus<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
"" }}}

"" hardmode
"" {{{
noremap <Leader>H <Esc>:call ToggleHardMode()<CR>
"" }}}

"" TaskList
"" {{{
map <Leader>tt <Plug>TaskList
"" }}}

"" vim-easymotion
"" {{{
"<Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
"" }}}

"" Goyo
"" {{{
nnoremap <silent> <C-g> :Goyo<CR>
"" }}}

"" Limelight
"" {{{
nnoremap <silent> <C-y> :Limelight!!<CR>
"" }}}

"" Commands for compiling and running C++ programs
"" {{{
:command C :exec ":!${CXX} -g ${CFLAGS} " .expand("%") "-o " .substitute(expand("%"),".cpp",".out","g")
:command C11 :exec ":!${CXX} -g ${CFLAGS} -std=c++11 " .expand("%") "-o " .substitute(expand("%"),".cpp",".out","g")
:command C1y :exec ":!${CXX} -g ${CFLAGS} -std=c++1y " .expand("%") "-o " .substitute(expand("%"),".cpp",".out","g")
:command R :exec "!./" .substitute(expand("%"),".cpp",".out","g")
"" }}}

" }}}

" Accompanying functions
" {{{

"Simple wrapper: do quickfix cmd, center line and if taglist.vim's window is
"open, sync, from vim.wikia.com/wiki/Search_using_quickfix_to_list_occurences
function s:Fancy_Quickfix_Cmd(Cmd)
	try
		execute a:Cmd
	catch /^Vim(\a\*):E553:/
		echohl ErrorMsg | echo v:exception | echohl None
	endtry
	norm! zz
	"If the laglist window is open then :TlistSync
	if bufwinnr('__Tag_List__') != -1
		TlistSync
	endif
endfunction

" Move to next closed fold, skipping open opnes
" Code from: http://stackoverflow.com/questions/9403098/is-it-possible-to-jump-to-closed-folds-in-vim/9407015#9407015
function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

" }}}
