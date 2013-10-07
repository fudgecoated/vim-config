set nocompatible

"判定当前操作系统类型
if(has("win32") || has("win95") || has("win64") || has("win16")) 
    let g:iswindows=1
else
    let g:iswindows=0
endif
"End

"设置文件内容缩进
if has("autocmd")
    filetype plugin indent on "根据文件进行缩进
    augroup vimrcEx
        au!
        autocmd FileType text setlocal textwidth=78
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \ exe "normal! g`\"" |
                    \ endif
    augroup END
else
    "智能缩进，相应的有cindent，官方说autoindent可以支持各种文件的缩进，但是效果会比只
	"支持C/C++的cindent效果会差一点，但笔者并没有看出来
    set autoindent " always set autoindenting on 
endif " has("autocmd")
"End

set vb t_vb=
"不自动换行
set nowrap
"高亮显示结果
set hlsearch
"在输入要搜索的文字时，vim会实时匹配
set incsearch
"允许退格键的使用
set backspace=indent,eol,start whichwrap+=<,>,[,]

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
"不自动设置字节序标记
"set nobomb
"设置行号
set number
"设置方法高亮
syntax enable
syntax on
"高亮显示匹配的括号
set showmatch
"指定配色方案为256色
set t_Co=256
"设置主题
colorscheme solarized
"高亮当前行
set cursorline
"设置tab和space
set tabstop=4
"set shiftwidth=4
"set expandtab
"set softtabstop=4
"set smarttab
"根据打开的文件自动切换工作目录
set autochdir
"设置在插入模式下的键移动方式
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
"End


"设置菜单和工具条通过快捷键F2显示和隐藏
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>
"End

