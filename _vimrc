" Startup {{{
" ----- 文件类型相关 ----- {{{
" 文件类型探测
filetype plugin indent on

" vim 文件折叠方式为 marker
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" 对于文本文件长于 78 个字符的行施行自动换行
autocmd FileType text setlocal textwidth=78
" }}}
" ----- vim 使用习惯 ----- {{{
" 禁用鼠标
set mouse-=a
" 打字时隐藏鼠标指针
set mousehide
" 禁用不必要的按键
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" }}}
" }}}

" General {{{
" 关闭对 vi 的兼容
set nocompatible

" 不创建备份文件
set nobackup

" 不创建交换文件
set noswapfile

" 保存 1024 个命令和 1024 个查找模式的历史
set history=1024

" 根据当前窗口的文件切换目录
set autochdir

" 允许指定键跨越行边界
set whichwrap=b,s,<,>,[,]

" 在插入模式下在哪里允许 <BS> 删除光标前面的字符
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Vim 的默认寄存器和系统剪贴板共享
set clipboard+=unnamed

" 设置 alt 键不映射到菜单栏
set winaltkeys=no
" }}}

" Lang & Encoding {{{
" 参与自动检测的字符编码
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" 设置 Vim 内部使用的字符编码
set encoding=utf-8

" 用于菜单翻译的语言
set langmenu=zh_CN

let $LANG='en_us.UTF-8'
" }}}

" GUI {{{
" 使用 Tomorrow-Night 主题
colorscheme Tomorrow-Night
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" 高亮光标所在的屏幕行
set cursorline

" 高亮显示所有匹配的单词
set hlsearch

" 显示行号
set number

" 新的窗口出现在当前窗口的下面
set splitbelow

" 垂直分割的窗口出现在当前窗口的右边
set splitright

" 不显示工具栏
set guioptions-=T

" 不显示菜单栏
set guioptions-=m

" 垂直分割窗口时，不显示左边的滚动条
set guioptions-=L

" 不显示右边的滚动条
set guioptions-=r

" 不显示底部的 (水平) 滚动条
set guioptions-=b

" 设置字体
set guifont=Inconsolata:h14:cANSI

" 设置 statusline
set statusline=%f
set statusline+=%m
set statusline+=%=
set statusline+=%{''.(&fenc!=''?&fenc:&enc).''}
set statusline+=/
set statusline+=%{&ff}    "file format
set statusline+=\ -\      " Separator
set statusline+=%l/%L
set statusline+=[%p%%]
set statusline+=\ -\      " Separator
set statusline+=%1*\ %y\ %*
" }}}

" Format {{{
" 开启新行时 (插入模式下输入 <cr>，或者使用 "o" 或 "O" 命令)，从当前行复制缩进距离
set autoindent

" 开启新行时使用智能自动缩进
set smartindent

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set foldmethod=indent

" 语法高亮显示
syntax enable
syntax on
" }}}

" Keymap {{{
" ---- leader 键设置 ---- {{{
" 设置leader键
let mapleader="\<space>"
" 设置localleader键
let maplocalleader="\\"
" }}}
" ----- vimrc 相关 ----- {{{
" 在一个新的分屏中编辑我的 vimrc 文件
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
" 重读我的 vimrc 文件
nnoremap <leader>vs :source $MYVIMRC<cr>
" }}}
" ----- 标签页相关 ----- {{{
nnoremap <silent> <tab>n :tabnew<cr>
nnoremap <silent> <tab>w :tabclose<cr>
nnoremap <silent> <tab>h :tabp<cr>
nnoremap <silent> <tab>l :tabn<cr>
nnoremap <silent> <leader>1 :tabn 1<cr>
nnoremap <silent> <leader>2 :tabn 2<cr>
nnoremap <silent> <leader>3 :tabn 3<cr>
nnoremap <silent> <leader>4 :tabn 4<cr>
nnoremap <silent> <leader>5 :tabn 5<cr>
nnoremap <silent> <leader>6 :tabn 6<cr>
nnoremap <silent> <leader>7 :tabn 7<cr>
nnoremap <silent> <leader>8 :tabn 8<cr>
nnoremap <silent> <leader>9 :tabn 9<cr>
nnoremap <silent> <leader>0 :tabn 10<cr>
nnoremap <silent> <s-tab> :tabnext<cr>
inoremap <silent> <s-tab> <esc>:tabnext<cr>
" }}}
" ----- 跳转分割窗口 ----- {{{
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-w> <c-w>c
" }}}
" ----- 正常模式下 alt + j, k, h, l 调整分割窗口大小 ----- {{{
nnoremap <m-j> :resize +5<cr>
nnoremap <m-k> :resize -5<cr>
nnoremap <m-h> :vertical resize -5<cr>
nnoremap <m-l> :vertical resize +5<cr>
" }}}
" ----- 插入模式下的 keymap ----- {{{
" 模拟 <esc>
inoremap jk <esc>

" 模拟方向键
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>

" 向前删除一个词
inoremap <c-bs> <esc>bdei

" 删除当前行
inoremap <c-d> <esc>ddi

" 自定义补全
inoremap <m-a> <c-x><c-u>
" }}}
" ----- 其他键相关 ----- {{{
" 按分号键直接进入命令模式
nnoremap ; :

" 按上下键强制居中
nnoremap j jzz
nnoremap k kzz

" 下移当前行
nnoremap - <esc>ddp

" 上移当前行
nnoremap _ <esc>ddkp

" 选中当前行
nnoremap vv ^vg_

" 将当前光标所在的单词用双引号括起来
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" 将当前光标所在的单词用单引号括起来
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" 移动到当前行的首部，加强版的 h
nnoremap H g^

" 移动到当前行的尾部，加强版的 l
nnoremap L g$

" 从当前位置复制到行尾
nnoremap Y y$

" 在资源管理器中打开当前目录
nnoremap <silent> <leader>ex :!start explorer %:P:H<cr>

" 在 cmd 中打开当前目录
nnoremap <silent> <leader>cmd :!start cmd /k cd %:p:h<cr>

" 打印当前时间
nnoremap <F3> A<c-r>=STRFTIME("%y-%M-%D %a %I:%M %p")<cr><esc>

" 高亮显示关键字后再按 Enter 键取消高亮
nnoremap <silent> <cr> :noh<cr>
" }}}
" }}}

" Plugin {{{
filetype off
" 设置Vundle的路径
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
call vundle#begin('$VIM/vimfiles/bundle')
" ----- Vundle ----- {{{
Plugin 'VundleVim/Vundle.vim'
" }}}
" ----- NerdTree ----- {{{
Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['.idea', '.vscode', 'node_modules', '*.pyc']
let NERDTreeBookmarksFile = $VIM . '/NERDTreeBookmarks'
let NERDTreeMinimalUI = 1
let NERDTreeBookmarksSort = 1
let NERDTreeShowLineNumbers = 0
let NERDTreeShowBookmarks = 1
let g:NERDTreeWinPos = 'right'
let g:NERDTreeDirArrowExpandable = '?'
let g:NERDTreeDirArrowCollapsible = '?'
noremap <leader>n :NERDTreeToggle<cr>
if exists('g:NERDTreeWinPos')
    autocmd vimenter * NERDTree D:\repo
endif
" }}}
" ----- EasyMotion ----- {{{
Plugin 'easymotion/vim-easymotion'
map <leader> <plug>(easymotion-prefix)
let g:EasyMotion_do_mapping=0
nmap f <plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase=1
map J <plug>(easymotion-j)
map K <plug>(easymotion-k)
" }}}
" ----- auto-pairs ----- {{{
Plugin 'jiangmiao/auto-pairs'
"  }}}
"  ----- vim-fugitive ----- {{{
Plugin 'tpope/vim-fugitive'
"  }}}
"  ----- vimim ----- {{{
Plugin 'vimim/vimim'
"  }}}
" ----- vim-smooth-scroll ----- {{{
Plugin 'terryma/vim-smooth-scroll'
nnoremap <silent> <leader>k :call smooth_scroll#up(&scroll*2, 0, 4)<cr>
nnoremap <silent> <leader>j :call smooth_scroll#down(&scroll*2, 0, 4)<cr>
"  }}}
" ----- vim-expand-region ----- {{{
Plugin 'terryma/vim-expand-region'
map vk <plug>(expand_region_expand)
map vj <plug>(expand_region_shrink)
"  }}}
" ----- vim-multiple-cursors ----- {{{
Plugin 'terryma/vim-multiple-cursors'
" }}}
" ----- vim-commentary ----- {{{
Plugin 'tpope/vim-commentary'
"  }}}
" ----- vim-surround ----- {{{
Plugin 'tpope/vim-surround'
"  }}}
" ----- vim-repeat ----- {{{
Plugin 'tpope/vim-repeat'
"  }}}
"  ----- fzf ----- {{{
Plugin 'junegunn/fzf'
"  }}}
" ----- ctrlp.vim ----- {{{
Plugin 'ctrlpvim/ctrlp.vim'
"  }}}
" ----- rking/ag.vim ----- {{{
Plugin 'rking/ag.vim'
"  }}}
" ----- Conque-Shell ----- {{{
Plugin 'vim-scripts/Conque-Shell'
"  }}}
" ----- bufferhint ---- {{{
Plugin 'bsdelf/bufferhint'
nnoremap - :call bufferhint#Popup()<cr>
nnoremap \ :call bufferhint#LoadPrevious()<cr>
"  }}}
" ----- JamshedVesuna/vim-markdown-previe ----- {{{
Plugin 'JamshedVesuna/vim-markdown-preview'
let vim_markdown_preview_hotkey='<c-m>'
let vim_markdown_preview_browser='Google Chrome'
"  }}}
filetype on
call vundle#end()
" }}}

