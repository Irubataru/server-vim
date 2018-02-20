"
"" - Plugin settings/options for vim -
"

"YouCompleteMe
"{{{
"let g:ycm_min_num_of_chars_for_completion = 2;
let g:ycm_complete_in_strings = 0
let g:ycm_warning_symbol = '?'
let g:ycm_error_symbol = '!'
let g:ycm_confirm_extra_conf = 0
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1,
      \ 'tex' : 1
      \}
"make YCM compatible with UltiSnips (http://stackoverflow.com/a/22253548/2874210)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_insertion = 1
"}}}

"CtrlSpace
"{{{

"let g:CtrlSpaceIgnoredFiles = '\v(doc|devel)[\/]'
let g:CtrlSpaceIgnoredFiles = '\v(data|doc)[\/]'

if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

"}}}

"UltiSnips
"{{{
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"
"}}}

"supertab
"{{{
let g:SuperTabDefaultCompletionType = '<C-n>'
"}}}

"vim-cpp-enhanced-highlight
"{{{
let g:cpp_experimental_template_highlight = 1
"}}}

"CtrlP
"{{{
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
let g:ctrlp_working_path_mode = 'r'

" Keymaps
nnoremap <Leader>p :CtrlP<CR>
"}}}

"vim-buffergator
"{{{
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1
"}}}

"vim-template
"{{{
let g:templates_no_autocmd = 1
let g:templates_directory = "$HOME/.vim/templates"
"}}}

"LaTeX-Box
"{{{
let g:LatexBox_latexmk_async = 1
let g:LatexBox_Folding = 1
let g:LatexBox_fold_automatic = 0
let g:LatexBox_quickfix = 2
let g:LatexBox_no_mappings = 1
"}}}

"lightline
"{{{

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

" Disable the tabline for CtrlSpace
let g:lightline.enable = {
    \ 'statusline': 1,
    \ 'tabline': 0
    \ }

" Need to fix lightline for CtrlSpace
" http://genkisugimoto.com/blog/vim-ctrlspace-with-lightline/
function! s:filtered_lightline_call(funcname)
  if bufname('%') == '__CS__'
    return
  endif
  execute 'call lightline#' . a:funcname . '()'
endfunction

augroup LightLine
  autocmd!
  autocmd WinEnter,BufWinEnter,FileType,ColorScheme * call s:filtered_lightline_call('update')
  autocmd ColorScheme,SessionLoadPost * call s:filtered_lightline_call('highlight')
  autocmd CursorMoved,BufUnload * call s:filtered_lightline_call('update_once')
augroup END

"}}}

"vim-fugitive
"{{{
if has("autocmd")
  autocmd BufReadPost fugitive://* set bufhidden=delete
endif
"}}}

"vim-bookmarks
"{{{
let g:bookmark_no_default_key_mappings = 1
"}}}

"localvimrc
"{{{
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0
"}}}

"operator-flashy
"{{{

" Need this for Base16 colours
"let g:operator#flashy#group = 'Base16Flashy'

"}}}

"vim-clang-format
"{{{
let g:clang_format#code_style = "llvm"
let g:clang_format#style_options = {
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "BreakBeforeBraces" : "Allman",
            \ "ConstructorInitializerAllOnOneLineOrOnePerLine" : "true",
            \ "Standard" : "C++11"}
"}}}

"GoYo / Limelight
"{{{

let g:goyo_width=100

function! s:goyo_enter()
  "" Disable tmux to get a clean window
  "silent !tmux set status off
  "silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z

  " No vim info either
  set noshowmode
  set noshowcmd
  set scrolloff=999

  " Also enable Limelight
  Limelight

  " For some reason I have to disable lightline manually
  call lightline#disable()
endfunction

function! s:goyo_leave()
  "" Enable tmux again
  "silent !tmux set status on
  "silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z

  " Re-enable vim info
  set showmode
  set showcmd
  set scrolloff=5

  " Re-compute the CtrlSpace tabline
  set tabline=%!ctrlspace#api#Tabline()

  " Turn off Limelight
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"}}}
