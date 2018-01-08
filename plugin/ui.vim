"" - User interface settings for vim -

" Colors and styling
"{{{

""{{{ Solarized theme
"let base16colorspace = 256
"set t_Co=256
""let g:solarized_termcolors=256
"set t_ut= "Fix for bg colour issues in tmux http://sunaku.github.io/vim-256color-bce.html
"set background=dark
"colorscheme solarized
""}}}

"{{{ base16 theme
let base16colorspace = 256
colorscheme base16-default-dark
"colorscheme base16-default-light
hi Base16Flashy term=bold ctermbg=18 guibg=#282828
"}}}

set conceallevel=1 "Use vims new conceal feature
set concealcursor=""
"}}}

" Settings related to text behaviour and margins
"{{{
set scrolloff=10      " number of lines to keep above and below cursor
set number            " show linenumbers

set wrap              " wrap text
set linebreak         " break lines when wrapping text
set nolist
set cinoptions=N-s    " namespaces doesn't count towards indentation
set textwidth=80
set wrapmargin=0

set formatoptions+=l
"}}}

" Tabs are defined as 2 spaces
"{{{
set tabstop=2 
set expandtab
set shiftwidth=2
"}}}

"Settings for Powerline
"{{{
set laststatus=2
set noshowmode
"}}}
