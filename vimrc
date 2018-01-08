" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype plugin on

" Get plugins using Plug
call plug#begin("~/.vim/plugged")

" General plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'wikitopian/hardmode'


" Buffer and file-management
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | 
      \ Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'MattesGroeger/vim-bookmarks'

" Additional functionality
Plug 'easymotion/vim-easymotion'
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'aperezdc/vim-template', { 'on': 'Template' }
Plug 'embear/vim-localvimrc'
Plug 'vim-scripts/TaskList.vim'
Plug 'itchyny/vim-cursorword', { 'for': 'cpp' }

" git related
Plug 'tpope/vim-fugitive'  " The best git plugin
Plug 'airblade/vim-rooter' " Changes the vim directory to project root

" Related to the look
Plug 'guns/xterm-color-table.vim'
Plug 'Irubataru/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'haya14busa/vim-operator-flashy' | 
      \ Plug 'kana/vim-operator-user'
Plug 'haya14busa/incsearch.vim'

" For C++
Plug 'ervandew/supertab' |
      \  Plug 'Valloric/YouCompleteMe', 
            \{ 'for': ['cpp', 'c', 'python'],
            \  'do': 'python2 install.py' }
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['cpp'] }
Plug 'drmikehenry/vim-headerguard', {'for': ['cpp', 'hpp'] }
Plug 'rhysd/vim-clang-format', { 'for': ['cpp', 'hpp', 'c'] } |
      \ Plug 'kana/vim-operator-user'

" For python
Plug 'google/yapf', { 'for': 'python' }

" For LaTeX
Plug 'LaTeX-Box-Team/LaTeX-Box', { 'for': 'tex' }
Plug 'Irubataru/latex-greek-letters', { 'for': 'tex' }
Plug 'kana/vim-textobj-user', { 'for': 'tex' } |
      \ Plug 'rbonvall/vim-textobj-latex', { 'for': 'tex' }

" For JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'Olical/vim-syntax-expand', { 'for': 'javascript' }
Plug 'elzr/vim-json', { 'for': 'json' }

" For Markdown
Plug 'tpope/vim-markdown', { 'for': 'markdown' }  |
      \ Plug 'nelstrom/vim-markdown-folding', { 'for': 'markdown' }

" Other syntax highlighting
Plug 'vim-scripts/gnuplot.vim'

call plug#end()
