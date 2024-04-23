" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

execute pathogen#infect()

" 语法高亮
syntax on

" 查找高亮
set hlsearch 
 
" 用浅色高亮当前行
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

" Tab键的宽度
set tabstop=4

"  统一缩进为4
set softtabstop=4
set shiftwidth=4
set expandtab

" 显示行号
set number

" 设置颜色主题
"colorscheme pablo
"set background=dark
"colorscheme solarized

" Enable italic. Default: 1
let g:kolor_italic=1

" Enable bold. Default: 1
let g:kolor_bold=1

" Enable underline. Default: 0
let g:kolor_underlined=0

" Gray 'MatchParen' color. Default: 0
let g:kolor_alternative_matchparen=0

" White foreground 'MatchParen' color that might work better with some terminals. Default: 0
let g:kolor_inverted_matchparen=0
colorscheme kolor

" 在编辑过程中，在右下角显示光标位置的状态行
set ruler

" 光标移动到buffer的顶部和底部时保持3行距离 
set scrolloff=3

"  自动加载NERDtree
autocmd vimenter * NERDTree

"  vim自动加载NERDtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"  vim文件夹自动加载NERDtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" vim光标自动移动至编辑区
autocmd VimEnter * NERDTree
wincmd w
autocmd VimEnter * wincmd w

"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" 设置NERDTree自动退出
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"缩进指示线"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

"autopep8设置"
let g:autopep8_disable_show_diff=1

"按F5运行python"
map <F5> :Autopep8<CR> :w<CR> :call RunPython()<CR>
function RunPython()
  let g:kolor_italic=1
  let g:kolor_bold=1
  let g:kolor_underlined=0
  let g:kolor_alternative_matchparen=0
  let g:kolor_inverted_matchparen=0
  colorscheme kolor

  let mp = &makeprg
  let ef = &errorformat
  let exeFile = expand("%:t")
  setlocal makeprg=python\ -u
  set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
  silent make %
  copen
  let &makeprg = mp
  let &errorformat = ef
endfunction
