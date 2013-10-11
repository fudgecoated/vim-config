set nocompatible
filetype off

"自动载入配置文件不需要重启
autocmd! bufwritepost _vimrc source %

"判定当前操作系统类型
if(has("win32") || has("win95") || has("win64") || has("win16")) 
    let g:iswindows=1
else
    let g:iswindows=0
endif
"End

"设置英文语言环境
let $LANG='en'
"设置菜单为英文
set langmenu=en
"设置字段及大小
set guifont=Anonymous_Pro:h11
set gfw=Consolas:h10
"设置内部编码为utf-8
set encoding=utf-8
"设置打开文件时使用的编码顺序
set fileencodings=utf-8,cp936,chinese,latin-1
"设置消息为英文并使用utf-8编码
language messages en_US.utf-8
"设置行号
set number
"设置方法高亮
syntax enable
syntax on
"高亮显示匹配的括号
set showmatch
"指定配色方案为256色
set t_Co=256
"设置命令行高为2
set cmdheight=2
"高亮当前行
set cursorline
"高亮显示匹配结果
set hlsearch
"在输入要搜索的文字时，vim实时匹配
set incsearch
"修改leader(默认为\)键为逗号
let mapleader=','
"设置tab和space
set tabstop=4
"set shiftwidth=4
"set expandtab
"set smarttab
"不自动换行
set nowrap
set vb t_vb=
"据打开的文件自动切换工作目录
set autochdir
"允许退格键的使用
set backspace=indent,eol,start whichwrap+=<,>,[,]
"取消/开启高亮显示匹配结果(normal模式下',-空格')
nnoremap <leader><space> :set hls!<CR>
"取消/开启自动换行
nnoremap <leader>w :set wrap!<CR>
"新建标签页(normal模式下',-t')
nnoremap <leader>t :tabnew<cr>

"Status line {
set laststatus=2
set statusline=
set statusline+=%-3.3n                      " buffer number
set statusline+=%f                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=0x%-8b                       " character value
set statusline+=%-14(%l,%c%v%)               " line, character
set statusline+=%<%p                         " file position
"}

"to save, press ctrl-s {
"在正常(normal)模式下直接:w保存
nmap <C-S> :w<CR>
"在插入(insert)模式下通过模拟<esc>:w<cr>a，即先回
"到normal模式，然后:w保存，最后输入a回到insert模式
imap <C-S> <ESC>:w<CR>a
"}

"设置在插入模式下的键移动方式 {
inoremap <C-H> <Left>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>
"}


"设置菜单和工具条通过快捷键F2显示和隐藏 {
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>
"}

"Vundle Setting {
set rtp+=$VIM/vimfiles/bundle/vundle/
call vundle#rc('$VIM/vimfiles/bundle/')

 " let Vundle manage Vundle
 " required! 
Bundle 'gmarik/vundle'

"}

"My Bundles Setting {

"设置主题 {
Bundle 'altercation/vim-colors-solarized'
set background=dark
colorscheme solarized
"}

"Markdown
Bundle 'plasticboy/vim-markdown'
"初始打开md文档不折叠
let g:vim_markdown_initial_foldlevel=1
"}

"JavaScript
Bundle 'pangloss/vim-javascript'

filetype plugin indent on     " required!
